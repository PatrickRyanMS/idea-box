<#
.SYNOPSIS
    Serves the design website with live reload for design review.

.DESCRIPTION
    Starts a local server to serve the design website from .github/.
    Uses browser-sync (via npx) for file watching and auto-reload.
    Falls back to .NET HttpListener if Node/npx is not available.

    The script resolves the .github directory relative to the project root.
    When run from the project root, the default ProjectRoot of "." works.

    A PID file is written to .github/.comp-server.pid so the server can be
    stopped cleanly with stop-comps.ps1.

.PARAMETER Port
    The port to serve on. Default: 3333

.PARAMETER ProjectRoot
    Path to the consuming project root. Default: current directory.

.PARAMETER Open
    Open the browser automatically after starting.

.EXAMPLE
    .\scripts\serve-comps.ps1 -Open

.EXAMPLE
    .\scripts\serve-comps.ps1 -Port 4444 -Open
#>

param(
    [Parameter(Mandatory=$false)]
    [int]$Port = 3333,

    [Parameter(Mandatory=$false)]
    [string]$ProjectRoot = ".",

    [Parameter(Mandatory=$false)]
    [switch]$Open
)

$ErrorActionPreference = "Stop"

# Resolve the .github directory relative to the project root
$ResolvedRoot = Resolve-Path $ProjectRoot
$GithubDir = Join-Path $ResolvedRoot ".github"

if (-not (Test-Path $GithubDir)) {
    Write-Error ".github directory not found at: $GithubDir"
    exit 1
}

# Check if something is actively listening on the port
$portInUse = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($portInUse) {
    Write-Host ""
    Write-Host "  Port $Port is already in use (active listener)." -ForegroundColor Yellow
    Write-Host "  The design site may already be running at http://localhost:$Port" -ForegroundColor Yellow
    Write-Host "  To use a different port: .\serve-comps.ps1 -Port <number>" -ForegroundColor DarkGray
    Write-Host ""
    if ($Open) {
        Start-Process "http://localhost:$Port"
    }
    exit 0
}

# Write PID file so stop-comps.ps1 can find us
$pidFile = Join-Path $GithubDir ".comp-server.pid"

Write-Host ""
Write-Host "  Design Website Server" -ForegroundColor Cyan
Write-Host "  =====================" -ForegroundColor Cyan
Write-Host "  Serving: $GithubDir" -ForegroundColor White
Write-Host "  URL:     http://localhost:$Port" -ForegroundColor Green
Write-Host ""

# ── Try browser-sync (live reload) ───────────────────────────
$useNpx = $false
try {
    $npxCmd = Get-Command npx -ErrorAction SilentlyContinue
    if ($npxCmd -and $npxCmd.CommandType -ne 'Application') {
        # npx is a shim/alias that may not work with Start-Process
        $useNpx = $false
    } elseif ($npxCmd) {
        $npxVersion = & npx --version 2>$null
        if ($LASTEXITCODE -eq 0 -and $npxVersion) {
            # Verify Start-Process can actually launch it
            try {
                $testProc = Start-Process -FilePath $npxCmd.Source -ArgumentList "--version" -PassThru -NoNewWindow -Wait -ErrorAction Stop
                $useNpx = ($testProc.ExitCode -eq 0)
            } catch {
                $useNpx = $false
            }
        }
    }
} catch { }

if ($useNpx) {
    Write-Host "  Mode: browser-sync (live reload)" -ForegroundColor Green
    Write-Host "  File changes will auto-reload the browser." -ForegroundColor DarkGray
    Write-Host ""

    $openFlag = if ($Open) { "--open" } else { "--no-open" }

    # Store the npx process ID for stop-comps.ps1
    $npxArgs = @(
        "-y", "browser-sync", "start",
        "--server", $GithubDir,
        "--port", $Port,
        "--files", "$GithubDir/**/*",
        "--no-notify",
        "--no-ui",
        $openFlag
    )

    $process = Start-Process -FilePath "npx" -ArgumentList $npxArgs -PassThru -NoNewWindow
    $process.Id | Set-Content -Path $pidFile -Force

    Write-Host "  Press Ctrl+C to stop (or run stop-comps.ps1)" -ForegroundColor DarkGray
    Write-Host ""

    try {
        $process.WaitForExit()
    } finally {
        if (-not $process.HasExited) { $process.Kill() }
        if (Test-Path $pidFile) { Remove-Item $pidFile -Force }
    }

} else {
    # ── Fallback: .NET HttpListener (no live reload) ─────────
    Write-Host "  Mode: HttpListener (no live reload — install Node.js for auto-reload)" -ForegroundColor Yellow
    Write-Host ""

    $PID | Set-Content -Path $pidFile -Force

    $mimeTypes = @{
        ".html" = "text/html; charset=utf-8"
        ".htm"  = "text/html; charset=utf-8"
        ".css"  = "text/css; charset=utf-8"
        ".js"   = "application/javascript; charset=utf-8"
        ".json" = "application/json; charset=utf-8"
        ".svg"  = "image/svg+xml"
        ".png"  = "image/png"
        ".jpg"  = "image/jpeg"
        ".jpeg" = "image/jpeg"
        ".gif"  = "image/gif"
        ".webp" = "image/webp"
        ".ico"  = "image/x-icon"
        ".woff" = "font/woff"
        ".woff2"= "font/woff2"
        ".ttf"  = "font/ttf"
        ".md"   = "text/plain; charset=utf-8"
        ".txt"  = "text/plain; charset=utf-8"
    }

    $listener = [System.Net.HttpListener]::new()
    $listener.Prefixes.Add("http://localhost:$Port/")

    try {
        $listener.Start()
    } catch {
        Write-Host "  Failed to start listener on port $Port — $($_.Exception.Message)" -ForegroundColor Red
        if (Test-Path $pidFile) { Remove-Item $pidFile -Force }
        exit 1
    }

    if ($Open) {
        Start-Process "http://localhost:$Port"
    }

    Write-Host "  Press Ctrl+C to stop (or run stop-comps.ps1)" -ForegroundColor DarkGray
    Write-Host ""

    try {
        while ($listener.IsListening) {
            $context = $listener.GetContext()
            $request = $context.Request
            $response = $context.Response

            $urlPath = [System.Uri]::UnescapeDataString($request.Url.AbsolutePath).TrimStart("/")
            if ([string]::IsNullOrEmpty($urlPath)) { $urlPath = "index.html" }

            $filePath = Join-Path $GithubDir $urlPath.Replace("/", "\")

            # Serve directory index
            if ((Test-Path $filePath) -and (Get-Item $filePath).PSIsContainer) {
                $indexPath = Join-Path $filePath "index.html"
                if (Test-Path $indexPath) { $filePath = $indexPath }
            }

            if (Test-Path $filePath -PathType Leaf) {
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                $contentType = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }

                $bytes = [System.IO.File]::ReadAllBytes($filePath)
                $response.StatusCode = 200
                $response.ContentType = $contentType
                $response.ContentLength64 = $bytes.Length
                $response.OutputStream.Write($bytes, 0, $bytes.Length)
            } else {
                $response.StatusCode = 404
                $msg = [System.Text.Encoding]::UTF8.GetBytes("404 — Not Found: $urlPath")
                $response.ContentType = "text/plain; charset=utf-8"
                $response.ContentLength64 = $msg.Length
                $response.OutputStream.Write($msg, 0, $msg.Length)
            }

            $response.OutputStream.Close()
        }
    } finally {
        if ($listener.IsListening) { $listener.Stop() }
        $listener.Close()
        if (Test-Path $pidFile) { Remove-Item $pidFile -Force }
        Write-Host ""
        Write-Host "  Server stopped." -ForegroundColor Cyan
    }
}

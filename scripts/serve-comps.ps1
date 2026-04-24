<#
.SYNOPSIS
    Serves the comp viewer on a separate port for design review.

.DESCRIPTION
    Starts a lightweight HTTP server to serve comp files from .github/comps/.
    Uses .NET HttpListener — no external dependencies (no npx, no Python).
    Runs on a separate port so it doesn't interfere with the project's dev server.

    The script resolves the comps directory relative to the project root (not the
    submodule). When run from the project root, the default ProjectRoot of "." works.

    A PID file is written to .github/comps/.comp-server.pid so the server can be
    stopped cleanly with stop-comps.ps1.

.PARAMETER Port
    The port to serve on. Default: 3333

.PARAMETER ProjectRoot
    Path to the consuming project root. Default: current directory.

.PARAMETER Open
    Open the browser automatically after starting.

.EXAMPLE
    # From your project root
    .\super-agent\scripts\serve-comps.ps1

.EXAMPLE
    .\super-agent\scripts\serve-comps.ps1 -Port 4444 -Open
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

# Resolve directories relative to the project root (not the submodule)
$ResolvedRoot = Resolve-Path $ProjectRoot
$GithubDir = Join-Path $ResolvedRoot ".github"
$CompsDir = Join-Path $GithubDir "comps"
$MoodBoardsDir = Join-Path $GithubDir "mood-boards"
$PalettesDir = Join-Path $GithubDir "palettes"

if (-not (Test-Path $CompsDir)) {
    Write-Error "Comps directory not found at: $CompsDir"
    exit 1
}

# Check if something is actively listening on the port
# Filter to Listen state only — TIME_WAIT/CLOSE_WAIT sockets (PID 0) linger
# after a server dies and are harmless; HttpListener can bind over them.
$portInUse = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($portInUse) {
    Write-Host ""
    Write-Host "  Port $Port is already in use (active listener)." -ForegroundColor Yellow
    Write-Host "  The comp viewer may already be running at http://localhost:$Port" -ForegroundColor Yellow
    Write-Host "  To use a different port: .\serve-comps.ps1 -Port <number>" -ForegroundColor DarkGray
    Write-Host ""
    if ($Open) {
        Start-Process "http://localhost:$Port"
    }
    exit 0
}

# MIME type map for common comp file types
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

# Write PID file so stop-comps.ps1 can find us
$pidFile = Join-Path $CompsDir ".comp-server.pid"
$PID | Set-Content -Path $pidFile -Force

Write-Host ""
Write-Host "  Comp Viewer Server" -ForegroundColor Cyan
Write-Host "  ==================" -ForegroundColor Cyan
Write-Host "  Serving: $GithubDir" -ForegroundColor White
Write-Host "  URL:     http://localhost:$Port" -ForegroundColor Green
Write-Host ""
Write-Host "  Active comps:   $CompsDir\active\" -ForegroundColor Yellow
Write-Host "  Approved comps: $CompsDir\approved\" -ForegroundColor Yellow
if (Test-Path $MoodBoardsDir) {
    Write-Host "  Mood boards:    $MoodBoardsDir\" -ForegroundColor Yellow
    Write-Host "  Mood board URL: http://localhost:$Port/mood-boards/" -ForegroundColor Green
}
Write-Host ""
Write-Host "  Press Ctrl+C to stop (or run stop-comps.ps1)" -ForegroundColor DarkGray
Write-Host ""

# Start .NET HttpListener — built into every PowerShell, no external deps
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$Port/")

try {
    $listener.Start()
} catch {
    Write-Host "  Failed to start listener on port $Port — $($_.Exception.Message)" -ForegroundColor Red
    if (Test-Path $pidFile) { Remove-Item $pidFile -Force }
    exit 1
}

# Open browser after server is listening
if ($Open) {
    Start-Process "http://localhost:$Port"
}

# Clean up on Ctrl+C or exit
$cleanup = {
    if ($listener.IsListening) { $listener.Stop() }
    $listener.Close()
    if (Test-Path $pidFile) { Remove-Item $pidFile -Force }
}

try {
    while ($listener.IsListening) {
        # Wait for a request (blocking)
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        # Decode the URL path and map to a file
        $urlPath = [System.Uri]::UnescapeDataString($request.Url.AbsolutePath).TrimStart("/")

        # Default to index.html for root requests
        if ([string]::IsNullOrEmpty($urlPath)) {
            $urlPath = "index.html"
        }

        # Route /mood-boards/ to the mood boards directory
        # Route /palettes/ to the palettes directory
        # Route root files (index.html, design-nav.json) to .github/
        # Route everything else to comps
        if ($urlPath -match '^mood-boards(/|$)') {
            $relativePath = $urlPath.Substring("mood-boards".Length).TrimStart("/")
            if ([string]::IsNullOrEmpty($relativePath)) { $relativePath = "index.html" }
            $filePath = Join-Path $MoodBoardsDir $relativePath.Replace("/", "\")
        } elseif ($urlPath -match '^palettes(/|$)') {
            $relativePath = $urlPath.Substring("palettes".Length).TrimStart("/")
            if ([string]::IsNullOrEmpty($relativePath)) { $relativePath = "index.html" }
            $filePath = Join-Path $PalettesDir $relativePath.Replace("/", "\")
        } elseif ($urlPath -match '^(index\.html|design-nav\.json)$') {
            $filePath = Join-Path $GithubDir $urlPath.Replace("/", "\")
        } else {
            $filePath = Join-Path $CompsDir $urlPath.Replace("/", "\")
        }

        # Serve directory index if path is a folder
        if ((Test-Path $filePath) -and (Get-Item $filePath).PSIsContainer) {
            $indexPath = Join-Path $filePath "index.html"
            if (Test-Path $indexPath) {
                $filePath = $indexPath
            }
        }

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.StatusCode = 200
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)

            Write-Host "  200  $urlPath" -ForegroundColor DarkGray
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 — Not Found: $urlPath")
            $response.ContentType = "text/plain; charset=utf-8"
            $response.ContentLength64 = $msg.Length
            $response.OutputStream.Write($msg, 0, $msg.Length)

            Write-Host "  404  $urlPath" -ForegroundColor DarkYellow
        }

        $response.OutputStream.Close()
    }
} finally {
    & $cleanup
    Write-Host ""
    Write-Host "  Server stopped." -ForegroundColor Cyan
}

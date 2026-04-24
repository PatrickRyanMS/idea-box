<#
.SYNOPSIS
    Stops the comp viewer server started by serve-comps.ps1.

.DESCRIPTION
    Reads the PID file written by serve-comps.ps1 and stops the server process.
    If no PID file is found, falls back to checking common comp server ports.

.PARAMETER ProjectRoot
    Path to the consuming project root. Default: current directory.

.EXAMPLE
    .\super-agent\scripts\stop-comps.ps1
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectRoot = "."
)

$ErrorActionPreference = "Stop"

$ResolvedRoot = Resolve-Path $ProjectRoot
$pidFile = Join-Path $ResolvedRoot ".github\comps\.comp-server.pid"

if (Test-Path $pidFile) {
    $serverPid = Get-Content $pidFile -Raw
    $serverPid = $serverPid.Trim()

    $process = Get-Process -Id $serverPid -ErrorAction SilentlyContinue
    if ($process) {
        Stop-Process -Id $serverPid -Force
        Write-Host ""
        Write-Host "  Comp server stopped (PID $serverPid)." -ForegroundColor Cyan
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "  Server process $serverPid is not running (already stopped)." -ForegroundColor Yellow
        Write-Host ""
    }

    Remove-Item $pidFile -Force
} else {
    Write-Host ""
    Write-Host "  No comp server PID file found." -ForegroundColor Yellow
    Write-Host "  The server may not be running, or it was started from a different project root." -ForegroundColor DarkGray
    Write-Host ""
}

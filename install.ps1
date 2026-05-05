#Requires -Version 5.1
$ErrorActionPreference = "Stop"

# HCR CLI Installer
# One-line install: irm https://install.hcr.dev/win | iex

$Repo = "PantheraLabs/hcr-install"
$InstallDir = "$env:LOCALAPPDATA\bin"
$BinName = "hcr-windows-x64.exe"

Write-Host "Installing HCR CLI..." -ForegroundColor Cyan

if (!(Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
}

$ApiUrl = "https://api.github.com/repos/$Repo/releases/latest"
$Headers = @{ "User-Agent" = "HCR-Installer" }
if ($env:GH_TOKEN) {
    $Headers["Authorization"] = "token $($env:GH_TOKEN)"
}

$Release = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers
$Asset = $Release.assets | Where-Object { $_.name -eq $BinName } | Select-Object -First 1
if (!$Asset) {
    Write-Error "Could not find binary: $BinName"
    exit 1
}

$TmpPath = "$env:TEMP\hcr-download.exe"
Invoke-WebRequest -Uri $Asset.browser_download_url -OutFile $TmpPath -UseBasicParsing -Headers $Headers

$TargetPath = "$InstallDir\hcr.exe"
Move-Item -Path $TmpPath -Destination $TargetPath -Force

# Update PATH (current + persistent)
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($CurrentPath -notlike "*${InstallDir}*") {
    [Environment]::SetEnvironmentVariable("Path", "$CurrentPath;$InstallDir", "User")
}
if ($env:PATH -notlike "*${InstallDir}*") {
    $env:PATH = "$InstallDir;$env:PATH"
}

Write-Host ""
Write-Host "HCR installed!" -ForegroundColor Green
Write-Host "Run: hcr --help" -ForegroundColor Green

# Wave Player Mobile — install or update (Windows)
#   iwr -useb https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.ps1 | iex
# Running it again updates to the latest version.

$ErrorActionPreference = 'Stop'
$Repo = 'w2story/wave-player-mobile'
$File = 'waveplayer-mobile.js'

Write-Host "`nWave Player Mobile" -ForegroundColor Green

# Spicetify first.
if (-not (Get-Command spicetify -ErrorAction SilentlyContinue)) {
    Write-Host 'Spicetify is not installed. Installing it now...' -ForegroundColor Yellow
    Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/spicetify/cli/main/install.ps1' | Invoke-Expression
    $env:PATH = [Environment]::GetEnvironmentVariable('PATH', 'User') + ';' + $env:PATH
    if (-not (Get-Command spicetify -ErrorAction SilentlyContinue)) {
        throw 'Spicetify was installed, but this window cannot see it yet. Open a new PowerShell window and run this again.'
    }
}

# Spicetify's folder (usually %APPDATA%\spicetify).
$root = (& spicetify path userdata 2>$null | Select-Object -Last 1)
if (-not $root -or -not (Test-Path $root)) { $root = Join-Path $env:APPDATA 'spicetify' }
$ext = Join-Path $root 'Extensions'
New-Item -ItemType Directory -Force -Path $ext | Out-Null

Write-Host "Downloading $File..."
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/$Repo/main/$File" -OutFile (Join-Path $ext $File)

# Register once; the original Wave Player would load first and hide this one.
$list = (& spicetify config extensions 2>$null) -join ' '
if ($list -match 'waveplayer\.js') { & spicetify config extensions 'waveplayer.js-' | Out-Null }
if ($list -notmatch [regex]::Escape($File)) { & spicetify config extensions $File | Out-Null }

# Windows puts the Store app's files back, so the patch is lost after a restart or Store update.
if (Get-AppxPackage -Name 'SpotifyAB.SpotifyMusic' -ErrorAction SilentlyContinue) {
    Write-Host "`nThis is the Microsoft Store version of Spotify. Spicetify doesn't survive a restart on it." -ForegroundColor Yellow
    Write-Host 'Uninstall it, install the regular version (winget install Spotify.Spotify or spotify.com/download),' -ForegroundColor Yellow
    Write-Host "open it once, then run: spicetify backup apply`n" -ForegroundColor Yellow
}

Write-Host 'Applying to Spotify...'
& spicetify apply

Write-Host "`nDone. Open the mini player from Spotify's miniplayer button, then the phone button (or press M)." -ForegroundColor Green

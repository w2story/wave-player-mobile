#!/bin/sh
# Wave Player Mobile — install or update (macOS / Linux)
#   curl -fsSL https://raw.githubusercontent.com/__REPO__/main/install.sh | sh
# Running it again updates to the latest version.

set -e
REPO='__REPO__'
FILE='waveplayer-mobile.js'

printf '\n\033[32mWave Player Mobile\033[0m\n'

# Spicetify first.
if ! command -v spicetify >/dev/null 2>&1; then
    echo 'Spicetify is not installed. Installing it now...'
    curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
    PATH="$HOME/.spicetify:$PATH"
    if ! command -v spicetify >/dev/null 2>&1; then
        echo 'Spicetify was installed, but this terminal cannot see it yet. Open a new terminal and run this again.'
        exit 1
    fi
fi

# Spicetify's folder (usually ~/.config/spicetify).
ROOT=$(spicetify path userdata 2>/dev/null | tail -n 1)
[ -d "$ROOT" ] || ROOT="$HOME/.config/spicetify"
EXT="$ROOT/Extensions"
mkdir -p "$EXT"

echo "Downloading $FILE..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/$FILE" -o "$EXT/$FILE"

# Register once; the original Wave Player would load first and hide this one.
LIST=$(spicetify config extensions 2>/dev/null || true)
case "$LIST" in *waveplayer.js*) spicetify config extensions 'waveplayer.js-' >/dev/null ;; esac
case "$LIST" in *"$FILE"*) ;; *) spicetify config extensions "$FILE" >/dev/null ;; esac

echo 'Applying to Spotify...'
spicetify apply

printf "\n\033[32mDone.\033[0m Open the mini player from Spotify's miniplayer button, then the phone button (or press M).\n"

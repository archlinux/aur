#!/usr/bin/env bash
set -e

INFOPATH="/opt/synthv-studio/info.txt"
SVPREFIX="$HOME/.synthv-studio"

if [ ! -d "$SVPREFIX" ]; then
    xdg-open "$INFOPATH"
    exit 0
fi
exec "$SVPREFIX/synthv-studio"

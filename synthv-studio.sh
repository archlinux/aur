#!/usr/bin/env bash
set -e

SVPACKAGE="/opt/synthv-studio/dist.zip"
SVPREFIX="$HOME/.synthv-studio"

if [ ! -d "$SVPREFIX" ]; then
    mkdir "$SVPREFIX"
fi
cd "$SVPREFIX"
if [ ! -f "./_installed" ]; then
    echo "Installing..."
    SVTYPE=`bsdtar -tf "$SVPACKAGE" | head -1`
    bsdtar -xf "$SVPACKAGE"
    mv "./$SVTYPE/"* "."
    rmdir "./$SVTYPE"
    touch "./_installed"
fi
exec "./synthv-studio"

#!/bin/bash
set -euo pipefail

export WINEPREFIX="$HOME/.rasaeroii/wine"
DOCS="$WINEPREFIX/drive_c/users/$(whoami)/Documents"

if [ ! -d "$HOME"/.rasaeroii ] ; then
   mkdir -pv "$WINEPREFIX"
   wineboot -u

   # Program files
   PROG="$WINEPREFIX/drive_c/rasaeroii"
   mkdir -pv "$PROG"
   find /usr/share/rasaeroii/bin -type f -mindepth 1 -maxdepth 1 \
      -exec ln -sv {} "$PROG" \;

   # Launch Site Data
   DOCS="$WINEPREFIX/drive_c/users/$(whoami)/Documents"
   mkdir -pv "$DOCS"
   cp -v /usr/share/rasaeroii/LSD.xml "$DOCS"
fi

WINEDEBUG=-all wine "$WINEPREFIX/drive_c/rasaeroii/RASAero II.exe" "$@"
echo "Launch site data can be found at $DOCS/LSD.xml"

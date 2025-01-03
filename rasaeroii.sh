#!/bin/bash
set -euo pipefail

export WINEPREFIX="$HOME/.rasaeroii/wine"
PROG="$WINEPREFIX/drive_c/rasaeroii"

if [ ! -d "$HOME"/.rasaeroii ] ; then
   mkdir -pv "$WINEPREFIX"
   wineboot -u

   # Program files
   ln -sf /usr/share/rasaeroii/bin "$PROG"
   # User files
   cp -r /usr/share/rasaeroii/data \
      "$WINEPREFIX/drive_c/users/$(whoami)/Documents/RASAero II"
fi

WINEDEBUG=-all wine "$PROG/RASAero II.exe" "$@"

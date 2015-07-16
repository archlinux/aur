#!/bin/bash
export WINEPREFIX="$HOME"/.babelmap/wine WINEDLLOVERRIDES="mscoree,mshtml="
if [ ! -d "$HOME"/.babelmap ] ; then
   mkdir -p "$HOME"/.babelmap/wine
   wineboot -u
fi
WINEDEBUG=-all wine /usr/share/babelmap/BabelMap.exe "$@"

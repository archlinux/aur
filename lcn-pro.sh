#!/bin/bash

export WINEPREFIX="$HOME"/.lcn-pro/wine
if [ ! -d "$HOME"/.lcn-pro ]; then
  mkdir -p "$HOME"/.lcn-pro/wine
  wineboot -u
fi

WINEDEBUG=-all wine /usr/share/lcn-pro/LCNPRO.exe "$@"

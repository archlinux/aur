#!/bin/bash
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/sumatrapdf"
export WINEPREFIX="$HOME"/.sumatrapdf/wine
if [ ! -d "$HOME"/.sumatrapdf ] ; then
  mkdir -p "$HOME"/.sumatrapdf/wine
  wineboot -u
fi
if [ ! -d $CONFIG_DIR ] ; then
  mkdir -p $CONFIG_DIR

  # SumatraPDF makes settings file in the same directory as SumatraPDF.exe
  ln -s /usr/share/sumatrapdf/sumatrapdf.exe "$CONFIG_DIR"/sumatrapdf.exe
fi
# WINEDEBUG=-all wine /usr/share/sumatrapdf/sumatrapdf.exe "$@"
WINEDEBUG=-all wine "$CONFIG_DIR"/sumatrapdf.exe "$@"

#!/bin/bash
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/sumatrapdf"
# use this directory to store wine environment
export WINEPREFIX="$CONFIG_DIR"/wine
# initialize custom wine environment
if [ ! -d $CONFIG_DIR ] ; then
  mkdir -p $CONFIG_DIR
  mkdir -p "$CONFIG_DIR"/wine
  wineboot -u
fi

WINEDEBUG=-all wine /usr/share/sumatrapdf/sumatrapdf.exe -appdata "$CONFIG_DIR" "$@"

#!/bin/bash
CONFIG_DIR="$XDG_CONFIG_HOME"
[ -z "$CONFIG_DIR" ] && CONFIG_DIR="$HOME/.config"

export WINEPREFIX="$CONFIG_DIR/ultravnc-viewer"
export WINEDLLOVERRIDES="mscoree,mshtml,winemp3.acm="

if [ ! -d "$WINEPREFIX" ] ; then
  mkdir -p "$WINEPREFIX" || exit 1
  wineboot -u
fi

wine /usr/lib/ultravnc-viewer/vncviewer.exe "$@"

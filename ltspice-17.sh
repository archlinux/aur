#!/bin/sh

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ltspice-17"

if [ ! -d "$CONFIG_DIR" ]; then
   mkdir -p "$CONFIG_DIR"
fi
if [ ! -f "$CONFIG_DIR/LTspice.ini" ]; then
   # disable sending telemetry
   echo -e "[Options]\nCaptureAnalytics=false" > "$CONFIG_DIR/LTspice.ini"
fi

WINEPREFIX="$HOME/.local/share/wineprefixes/ltspice-17"
if [ ! -d "$WINEPREFIX" ]; then
   mkdir -p "$WINEPREFIX"
fi

export WINEARCH=win64
export WINEPREFIX

wine /usr/lib/wine/x86_64-windows/start.exe /unix /usr/share/ltspice-17/XVIIx64.exe -ini "$CONFIG_DIR/LTspice.ini" "$@"

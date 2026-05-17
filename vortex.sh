#!/bin/sh

export IGNORE_UPDATES=yes
export ELECTRON_TRASH=gio

_CP2077="$HOME/.config/Vortex/plugins/Vortex Extension Update - Cyberpunk 2077/index.js"
if [ -f "$_CP2077" ] && [ "$(head -1 "$_CP2077" 2>/dev/null)" != "// vortex-linux-fix" ]; then
    python3 /opt/Vortex/patch-cp2077-ext.py 2>/dev/null
fi

if [ -n "$1" ]; then
  exec /opt/Vortex/vortex --download "$@"
else
  exec /opt/Vortex/vortex
fi

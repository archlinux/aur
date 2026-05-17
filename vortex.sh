#!/bin/sh

export IGNORE_UPDATES=yes
export ELECTRON_TRASH=gio

for _p in /opt/Vortex/patch-ext-*.py; do
    [ -f "$_p" ] && python3 "$_p" 2>/dev/null
done

if [ -n "$1" ]; then
  exec /opt/Vortex/vortex --download "$@"
else
  exec /opt/Vortex/vortex
fi

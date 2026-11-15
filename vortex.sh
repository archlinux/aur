#!/bin/sh

export IGNORE_UPDATES=yes
export ELECTRON_TRASH=gio

if [ -n "$1" ]; then
  exec /opt/Vortex/vortex --download "$@"
else
  exec /opt/Vortex/vortex
fi

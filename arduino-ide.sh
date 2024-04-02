#!/bin/sh

if [ $XDG_SESSION_TYPE = "wayland" ] && [ -c /dev/nvidia0 ]; then
  FLAGS="--disable-gpu-sandbox"
fi

exec /usr/lib/electron27/electron /usr/lib/arduino-ide/arduino-ide-electron-main.js $FLAGS "$@"

# vim: ts=2 sw=2 et:

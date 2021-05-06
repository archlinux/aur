#!/bin/sh

[[ -d ~/.a7800 ]] || mkdir -p -m 760 ~/.a7800/roms
[[ -d ~/.a7800/a7800.ini ]] || cd ~/.a7800 && /opt/a7800/a7800 -createconfig
cd ~/.a7800 && exec /opt/a7800/a7800 "$@" &>/dev/null &

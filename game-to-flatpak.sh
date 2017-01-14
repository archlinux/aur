#! /bin/bash
set -e
export LUA_INIT='package.path="/usr/share/flatpak-games/?.lua;"..package.path'
exec /usr/bin/lua -- /usr/share/flatpak-games/game-to-flatpak.lua "$@"

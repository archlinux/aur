#!/bin/sh

XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
mkdir -p "$XDG_DATA_HOME/replugged/"{plugins,themes}

ln -s "/usr/share/replugged/src/fake_node_modules" "$XDG_DATA_HOME/replugged/node_modules" &>/dev/null

exec electron19 /usr/share/replugged "$@"
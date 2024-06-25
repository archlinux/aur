#!/bin/sh
readonly datadir=${XDG_DATA_HOME:-$HOME/.local/share}/shadps4

mkdir -p "$datadir" && cd "$datadir" && exec /usr/lib/shadps4/shadps4 "$@"

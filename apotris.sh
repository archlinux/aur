#!/bin/sh
readonly statedir=${XDG_STATE_HOME:-$HOME/.local/state}/apotris

mkdir -p "$statedir" && cd "$statedir" && exec /usr/lib/apotris/Apotris "$@"

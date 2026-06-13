#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/glassy-music-flags.conf" ]]; then
   GLASSY_MUSIC_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/glassy-music-flags.conf")"
fi

# Launch
export ELECTRON_IS_DEV=0
exec electron@ELECTRONVERSION@ /usr/lib/glassy-music-nankill/app.asar $GLASSY_MUSIC_USER_FLAGS "$@"

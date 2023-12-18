#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/youtube-music-flags.conf" ]]; then
   YOUTUBE_MUSIC_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/youtube-music-flags.conf")"
fi

# Launch
export ELECTRON_IS_DEV=0
exec electron28 /usr/lib/youtube-music/app.asar $YOUTUBE_MUSIC_USER_FLAGS "$@"

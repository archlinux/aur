#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/youtube-music-flags.conf" ]]; then
   YOUTUBE_MUSIC_USER_FLAGS="$(cat "$XDG_CONFIG_HOME/youtube-music-flags.conf")"
fi

# Launch
exec electron20 /usr/lib/youtube-music/app.asar $YOUTUBE_MUSIC_USER_FLAGS "$@"

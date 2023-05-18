#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/youtube-music-flags.conf" ]]; then
   YOUTUBE_MUSIC_USER_FLAGS="$(cat "$XDG_CONFIG_HOME/youtube-music-flags.conf")"
fi

# Launch
export ELECTRON_IS_DEV=0
exec /opt/YouTube\ Music/youtube-music $YOUTUBE_MUSIC_USER_FLAGS "$@"

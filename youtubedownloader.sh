#!/bin/sh

export YOUTUBEDOWNLOADER_ALLOW_AUTO_UPDATE=false
export YOUTUBEDOWNLOADER_SETTINGS_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/YoutubeDownloader"

exec /usr/lib/youtubedownloader/YoutubeDownloader "$@"

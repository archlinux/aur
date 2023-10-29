#!/usr/bin/env sh

YTDLP="$(which yt-dlp)"
exec "${YTDLP}" --compat-options youtube-dl "$@"

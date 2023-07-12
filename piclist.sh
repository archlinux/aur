#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron22 /opt/electron-youtube-music/electron-youtube-music.asar "$@"
else
    exec electron22 --no-sandbox /opt/electron-youtube-music/electron-youtube-music.asar "$@"
fi
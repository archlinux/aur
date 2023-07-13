#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron13 /opt/flb-music-player/flb-music-player.asar "$@"
else
    exec electron13 --no-sandbox /opt/flb-music-player/flb-music-player.asar "$@"
fi
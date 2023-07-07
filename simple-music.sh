#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/simple-music/simple-music.asar "$@"
else
    exec electron --no-sandbox /opt/simple-music/simple-music.asar "$@"
fi
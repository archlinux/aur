#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron15 /opt/apple-music-electron/app.asar "$@"
else
    exec electron15 --no-sandbox /opt/apple-music-electron/app.asar "$@"
fi
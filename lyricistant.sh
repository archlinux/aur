#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/lyricistant/lyricistant.asar "$@"
else
    exec electron --no-sandbox /opt/lyricistant/lyricistant.asar "$@"
fi
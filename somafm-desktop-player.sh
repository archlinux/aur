#!/bin/bash
_ELECTRON=/usr/bin/electron16
_ASAR="/opt/somafm-desktop-player/somafm-desktop-player.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
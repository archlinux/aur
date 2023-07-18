#!/bin/bash
_ELECTRON=/usr/bin/electron17
_ASAR="/opt/projscope-music-player/projscope-music-player.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
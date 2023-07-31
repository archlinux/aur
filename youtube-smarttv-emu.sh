#!/bin/bash
_ELECTRON=/usr/bin/electron21
_ASAR="/opt/youtube-smarttv-emu/youtube-smarttv-emu.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
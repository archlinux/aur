#!/bin/bash
_ELECTRON=/usr/bin/electron24
_ASAR="/opt/live-plus-plus/live-plus-plus.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
#!/bin/bash
_ELECTRON=/usr/bin/electron21
_ASAR="/opt/pocket-casts-desktop/pocket-casts-desktop.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
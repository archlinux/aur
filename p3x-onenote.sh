#!/bin/bash
_ELECTRON=/usr/bin/electron24
_ASAR="/opt/p3x-onenote/p3x-onenote.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
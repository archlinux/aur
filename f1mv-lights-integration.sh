#!/bin/bash
_ELECTRON=/usr/bin/electron23
_ASAR="/opt/f1mv-lights-integration/f1mv-lights-integration.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
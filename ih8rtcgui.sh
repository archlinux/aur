#!/bin/bash
_ELECTRON=/usr/bin/electron25
_ASAR="/opt/ih8rtcgui/ih8rtcgui.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
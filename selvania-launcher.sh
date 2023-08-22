#!/bin/bash
_ELECTRON=/usr/bin/electron26
_ASAR="/opt/selvania-launcher/selvania-launcher.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
#!/bin/bash
_ELECTRON_VER=24
_ASAR="/opt/helioslauncher/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron${_ELECTRON_VER} ${_ASAR} "$@"
else
    exec electron${_ELECTRON_VER} ${_ASAR} --no-sandbox "$@"
fi
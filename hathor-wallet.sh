#!/bin/bash
_ELECTRON_VER=13
_ASAR="/opt/guiwrapper/guiwrapper.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron${_ELECTRON_VER} ${_ASAR} "$@"
else
    exec electron${_ELECTRON_VER} ${_ASAR} --no-sandbox "$@"
fi
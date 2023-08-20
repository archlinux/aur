#!/bin/bash
_ELECTRON=/usr/bin/electron19
_ASAR="/opt/dk-c++/dk-c++.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi
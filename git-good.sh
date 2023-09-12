#!/bin/bash
_ELECTRON=/usr/bin/electron25
_ASAR="/opt/git-good/git-good.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR}  %F "$@"
else
    exec ${_ELECTRON} ${_ASAR}  %F --no-sandbox "$@"
fi
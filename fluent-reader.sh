#!/bin/bash
export ELECTRON_FORCE_IS_PACKAGED=true
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron ASAR "$@"
else
    exec electron --no-sandbox ASAR "$@"
fi

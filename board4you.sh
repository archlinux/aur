#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/board4you/app.asar "$@"
else
    exec electron --no-sandbox /opt/board4you/app.asar "$@"
fi
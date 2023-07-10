#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/bdash/app.asar "$@"
else
    exec electron --no-sandbox /opt/bdash/app.asar "$@"
fi
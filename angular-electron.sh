#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/angular-electron/app.asar "$@"
else
    exec electron --no-sandbox /opt/angular-electron/app.asar "$@"
fi
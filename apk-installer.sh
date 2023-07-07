#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/apk-installer/app.asar "$@"
else
    exec electron --no-sandbox /opt/apk-installer/app.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/coinstac-desktop-app/app.asar "$@"
else
    exec electron --no-sandbox /opt/coinstac-desktop-app/app.asar "$@"
fi
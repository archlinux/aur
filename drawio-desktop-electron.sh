#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/drawio-desktop-electron/drawio-desktop-electron.asar "$@"
else
    exec electron --no-sandbox /opt/drawio-desktop-electron/drawio-desktop-electron.asar "$@"
fi
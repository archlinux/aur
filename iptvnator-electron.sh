#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/iptvnator-electron/iptvnator-electron.asar "$@"
else
    exec electron --no-sandbox /opt/iptvnator-electron/iptvnator-electron.asar "$@"
fi
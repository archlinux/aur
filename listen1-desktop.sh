#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron13 /opt/listen1-desktop/listen1-desktop.asar "$@"
else
    exec electron13 --no-sandbox /opt/listen1-desktop/listen1-desktop.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/bilibilivideodownload/app.asar "$@"
else
    exec electron --no-sandbox /opt/bilibilivideodownload/app.asar "$@"
fi
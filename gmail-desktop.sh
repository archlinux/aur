#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/gmail-desktop/app.asar "$@"
else
    exec electron --no-sandbox /opt/gmail-desktop/app.asar "$@"
fi
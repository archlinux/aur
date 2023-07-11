#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/desktop-notifier/app.asar "$@"
else
    exec electron --no-sandbox /opt/desktop-notifier/app.asar "$@"
fi
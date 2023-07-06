#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/stampnyaa/app.asar "$@"
else
    exec electron --no-sandbox /opt/stampnyaa/app.asar "$@"
fi
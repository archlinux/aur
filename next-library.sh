#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/next-library/app.asar "$@"
else
    exec electron --no-sandbox /opt/next-library/app.asar "$@"
fi
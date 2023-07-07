#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/orca-writer/app.asar "$@"
else
    exec electron --no-sandbox /opt/orca-writer/app.asar "$@"
fi
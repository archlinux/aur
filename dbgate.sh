#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/dbgate/app.asar "$@"
else
    exec electron --no-sandbox /opt/dbgate/app.asar "$@"
fi
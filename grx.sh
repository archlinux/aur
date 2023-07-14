#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/grx/app.asar "$@"
else
    exec electron24 --no-sandbox /opt/grx/app.asar "$@"
fi
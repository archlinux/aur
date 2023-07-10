#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/laradumps/app.asar "$@"
else
    exec electron24 --no-sandbox /opt/laradumps/app.asar "$@"
fi
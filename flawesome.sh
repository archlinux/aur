#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron9 /opt/flawesome/app.asar "$@"
else
    exec electron9 --no-sandbox /opt/flawesome/app.asar "$@"
fi
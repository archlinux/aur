#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron25 /opt/electronim/app.asar "$@"
else
    exec electron25 --no-sandbox /opt/electronim/app.asar "$@"
fi
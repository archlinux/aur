#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron23 /opt/eagle-animation/app.asar "$@"
else
    exec electron23 --no-sandbox /opt/eagle-animation/app.asar "$@"
fi
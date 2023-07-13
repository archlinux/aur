#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron23 /opt/fotograph/app.asar "$@"
else
    exec electron23 --no-sandbox /opt/fotograph/app.asar "$@"
fi
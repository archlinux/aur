#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron23 /opt/query-master/app.asar "$@"
else
    exec electron23 --no-sandbox /opt/query-master/app.asar "$@"
fi
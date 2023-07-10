#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/crankshaft-client/app.asar "$@"
else
    exec electron --no-sandbox /opt/crankshaft-client/app.asar "$@"
fi
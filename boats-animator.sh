#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/boats-animator/app.asar "$@"
else
    exec electron --no-sandbox /opt/boats-animator/app.asar "$@"
fi
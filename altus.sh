#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/altus/altus.asar "$@"
else
    exec electron --no-sandbox /opt/altus/altus.asar "$@"
fi
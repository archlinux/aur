#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/altair/altair.asar "$@"
else
    exec electron --no-sandbox /opt/altair/altair.asar "$@"
fi
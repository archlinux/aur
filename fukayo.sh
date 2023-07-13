#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/fukayo/fukayo.asar "$@"
else
    exec electron24 --no-sandbox /opt/fukayo/fukayo.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron22 /opt/epherome/epherome.asar "$@"
else
    exec electron22 --no-sandbox /opt/epherome/epherome.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/ficus/ficus.asar "$@"
else
    exec electron --no-sandbox /opt/ficus/ficus.asar "$@"
fi
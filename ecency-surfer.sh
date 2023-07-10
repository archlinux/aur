#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/ecency-surfer/ecency-surfer.asar "$@"
else
    exec electron --no-sandbox /opt/ecency-surfer/ecency-surfer.asar "$@"
fi
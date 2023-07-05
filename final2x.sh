#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/final2x/final2x.asar "$@"
else
    exec electron --no-sandbox /opt/final2x/final2x.asar "$@"
fi
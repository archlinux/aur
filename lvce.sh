#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/lvce/lvce.asar "$@"
else
    exec electron --no-sandbox /opt/lvce/lvce.asar "$@"
fi
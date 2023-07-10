#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/datefile/datefile.asar "$@"
else
    exec electron --no-sandbox /opt/datefile/datefile.asar "$@"
fi
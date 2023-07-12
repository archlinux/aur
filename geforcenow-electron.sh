#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/geforcenow-electron/geforcenow-electron.asar "$@"
else
    exec electron24 --no-sandbox /opt/geforcenow-electron/geforcenow-electron.asar "$@"
fi
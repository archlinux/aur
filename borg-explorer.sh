#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/borg-explorer/borg-explorer.asar "$@"
else
    exec electron --no-sandbox /opt/borg-explorer/borg-explorer.asar "$@"
fi
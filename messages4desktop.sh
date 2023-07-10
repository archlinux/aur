#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/messages4desktop/messages4desktop.asar "$@"
else
    exec electron --no-sandbox /opt/messages4desktop/messages4desktop.asar "$@"
fi
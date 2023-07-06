#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/backend-ai-desktop/app.asar "$@"
else
    exec electron --no-sandbox /opt/backend-ai-desktop/app.asar "$@"
fi
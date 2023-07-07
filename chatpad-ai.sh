#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/chatpad-ai/chatpad-ai.asar "$@"
else
    exec electron --no-sandbox /opt/chatpad-ai/chatpad-ai.asar "$@"
fi
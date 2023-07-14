#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron10 /opt/google-assistant-unofficial-desktop-client/google-assistant-unofficial-desktop-client.asar "$@"
else
    exec electron10 --no-sandbox /opt/google-assistant-unofficial-desktop-client/google-assistant-unofficial-desktop-client.asar "$@"
fi
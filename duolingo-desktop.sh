#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/duolingo-desktop/duolingo-desktop.asar "$@"
else
    exec electron24 --no-sandbox /opt/duolingo-desktop/duolingo-desktop.asar "$@"
fi
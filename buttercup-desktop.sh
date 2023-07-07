#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/buttercup-desktop/buttercup-desktop.asar "$@"
else
    exec electron --no-sandbox /opt/buttercup-desktop/buttercup-desktop.asar "$@"
fi
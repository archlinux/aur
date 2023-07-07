#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/brs-emu-app/brs-emu-app.asar "$@"
else
    exec electron --no-sandbox /opt/brs-emu-app/brs-emu-app.asar "$@"
fi
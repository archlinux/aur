#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/chatall/chatall.asar "$@"
else
    exec electron --no-sandbox /opt/chatall/chatall.asar "$@"
fi
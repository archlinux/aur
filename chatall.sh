#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron25 /opt/chatall/chatall.asar "$@"
else
    exec electron25 --no-sandbox /opt/chatall/chatall.asar "$@"
fi
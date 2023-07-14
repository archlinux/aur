#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron25 /opt/goofcord/goofcord.asar "$@"
else
    exec electron25 --no-sandbox /opt/goofcord/goofcord.asar "$@"
fi
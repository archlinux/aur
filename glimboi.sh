#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron18 /opt/glimboi/glimboi.asar "$@"
else
    exec electron18 --no-sandbox /opt/glimboi/glimboi.asar "$@"
fi
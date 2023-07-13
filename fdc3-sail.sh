#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/fdc3-sail/fdc3-sail.asar "$@"
else
    exec electron24 --no-sandbox /opt/fdc3-sail/fdc3-sail.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron23 /opt/f1mv-lights-integration/f1mv-lights-integration.asar "$@"
else
    exec electron23 --no-sandbox /opt/f1mv-lights-integration/f1mv-lights-integration.asar "$@"
fi
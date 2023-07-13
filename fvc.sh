#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron12 /opt/fvc/fvc.asar "$@"
else
    exec electron12 --no-sandbox /opt/fvc/fvc.asar "$@"
fi
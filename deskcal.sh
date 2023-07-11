#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/deskcal/deskcal.asar "$@"
else
    exec electron --no-sandbox /opt/deskcal/deskcal.asar "$@"
fi
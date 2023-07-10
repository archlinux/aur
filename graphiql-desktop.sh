#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron21 /opt/miteiru/miteiru.asar "$@"
else
    exec electron21 --no-sandbox /opt/miteiru/miteiru.asar "$@"
fi
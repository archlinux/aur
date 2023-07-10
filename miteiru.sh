#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/miteiru/miteiru.asar "$@"
else
    exec electron --no-sandbox /opt/miteiru/miteiru.asar "$@"
fi
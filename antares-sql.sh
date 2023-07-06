#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/antares-sql/app.asar "$@"
else
    exec electron --no-sandbox /opt/antares-sql/app.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/jasperapp/jasperapp.asar "$@"
else
    exec electron --no-sandbox /opt/jasperapp/jasperapp.asar "$@"
fi
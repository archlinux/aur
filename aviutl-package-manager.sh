#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/aviutl-package-manager/app.asar "$@"
else
    exec electron --no-sandbox /opt/aviutl-package-manager/app.asar "$@"
fi
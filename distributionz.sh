#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/distributionz/distributionz.asar "$@"
else
    exec electron --no-sandbox /opt/distributionz/distributionz.asar "$@"
fi
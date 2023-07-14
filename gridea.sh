#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron7 /opt/gridea/gridea.asar "$@"
else
    exec electron7 --no-sandbox /opt/gridea/gridea.asar "$@"
fi
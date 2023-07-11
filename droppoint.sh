#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron13 /opt/droppoint/droppoint.asar "$@"
else
    exec electron13 --no-sandbox /opt/droppoint/droppoint.asar "$@"
fi
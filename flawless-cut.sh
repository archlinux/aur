#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron23 /opt/flawless-cut/flawless-cut.asar "$@"
else
    exec electron23 --no-sandbox /opt/flawless-cut/flawless-cut.asar "$@"
fi
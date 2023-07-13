#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron19 /opt/ferrum/ferrum.asar "$@"
else
    exec electron19 --no-sandbox /opt/ferrum/ferrum.asar "$@"
fi
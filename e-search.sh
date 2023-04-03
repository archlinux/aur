#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /usr/lib/esearch "$@"
else
    exec electron --no-sandbox /usr/lib/esearch "$@"
fi

#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/casterr/casterr.asar "$@"
else
    exec electron --no-sandbox /opt/casterr/casterr.asar "$@"
fi
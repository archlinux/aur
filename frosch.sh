#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron11 /opt/frosch/frosch.asar "$@"
else
    exec electron11 --no-sandbox /opt/frosch/frosch.asar "$@"
fi
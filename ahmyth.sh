#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/ahmyth/ahmyth.asar "$@"
else
    exec electron --no-sandbox /opt/ahmyth/ahmyth.asar "$@"
fi
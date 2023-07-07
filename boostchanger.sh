#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/boostchanger/boostchanger.asar "$@"
else
    exec electron --no-sandbox /opt/boostchanger/boostchanger.asar "$@"
fi
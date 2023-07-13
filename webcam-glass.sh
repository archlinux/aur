#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron20 /opt/gchat/gchat.asar "$@"
else
    exec electron20 --no-sandbox /opt/gchat/gchat.asar "$@"
fi
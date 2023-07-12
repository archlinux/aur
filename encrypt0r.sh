#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron18 /opt/encrypt0r/encrypt0r.asar "$@"
else
    exec electron18 --no-sandbox /opt/encrypt0r/encrypt0r.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /usr/lib/balena-etcher-electron "$@"
else
    exec electron --no-sandbox /usr/lib/balena-etcher-electron "$@"
fi

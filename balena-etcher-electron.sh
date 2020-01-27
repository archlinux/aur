#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron6 /usr/lib/balena-etcher "$@"
else
    exec electron6 --no-sandbox /usr/lib/balena-etcher "$@"
fi

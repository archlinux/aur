#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron7 /usr/lib/balena-etcher "$@"
else
    exec electron7 --no-sandbox /usr/lib/balena-etcher "$@"
fi

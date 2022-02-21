#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron12 /usr/lib/etcher-git "$@"
else
    exec electron12 --no-sandbox /usr/lib/etcher-git "$@"
fi

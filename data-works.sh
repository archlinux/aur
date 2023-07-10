#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/data-works/data-works.asar "$@"
else
    exec electron --no-sandbox /opt/data-works/data-works.asar "$@"
fi
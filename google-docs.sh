#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron25 /opt/google-docs/google-docs.asar "$@"
else
    exec electron25 --no-sandbox /opt/google-docs/google-docs.asar "$@"
fi
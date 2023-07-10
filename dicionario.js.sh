#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/dicionario.js/dicionario.js.asar "$@"
else
    exec electron --no-sandbox /opt/dicionario.js/dicionario.js.asar "$@"
fi
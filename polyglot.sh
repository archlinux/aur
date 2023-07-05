#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/polyglot/polyglot.asar "$@"
else
    exec electron --no-sandbox /opt/polyglot/polyglot.asar "$@"
fi
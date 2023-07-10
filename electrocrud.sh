#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/electrocrud/electrocrud.asar "$@"
else
    exec electron --no-sandbox /opt/electrocrud/electrocrud.asar "$@"
fi
#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/bulkurlopener/bulkurlopener.asar "$@"
else
    exec electron --no-sandbox /opt/bulkurlopener/bulkurlopener.asar "$@"
fi
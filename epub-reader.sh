#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/epub-reader/epub-reader.asar "$@"
else
    exec electron --no-sandbox /opt/epub-reader/epub-reader.asar "$@"
fi
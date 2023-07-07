#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/bookmarks-manager/app.asar "$@"
else
    exec electron --no-sandbox /opt/bookmarks-manager/app.asar "$@"
fi
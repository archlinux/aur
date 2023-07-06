#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/addressbook-desktop/addressbook-desktop.asar "$@"
else
    exec electron --no-sandbox /opt/addressbook-desktop/addressbook-desktop.asar "$@"
fi
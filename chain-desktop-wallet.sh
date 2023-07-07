#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/chain-desktop-wallet/app.asar "$@"
else
    exec electron --no-sandbox /opt/chain-desktop-wallet/app.asar "$@"
fi
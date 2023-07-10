#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/coal-launcher/coal-launcher.asar "$@"
else
    exec electron --no-sandbox /opt/coal-launcher/coal-launcher.asar "$@"
fi
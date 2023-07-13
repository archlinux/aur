#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron16 /opt/fishpi/fishpi.asar "$@"
else
    exec electron16 --no-sandbox /opt/fishpi/fishpi.asar "$@"
fi
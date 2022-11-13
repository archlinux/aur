#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron16 /usr/lib/picgo/app.asar "$@"
else
    exec electron16 --no-sandbox /usr/lib/picgo/app.asar "$@"
fi

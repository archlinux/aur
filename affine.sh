#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/affine/affine.asar "$@"
else
    exec electron --no-sandbox /opt/affine/affine.asar "$@"
fi
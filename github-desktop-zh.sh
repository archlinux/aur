#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron24 /opt/github-desktop-zh/github-desktop-zh.asar "$@"
else
    exec electron24 --no-sandbox /opt/github-desktop-zh/github-desktop-zh.asar "$@"
fi
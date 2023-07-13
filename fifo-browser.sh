#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron20 /opt/fifo-browser/fifo-browser.asar "$@"
else
    exec electron20 --no-sandbox /opt/fifo-browser/fifo-browser.asar "$@"
fi
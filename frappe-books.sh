#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron18 /opt/frappe-books/app.asar "$@"
else
    exec electron18 --no-sandbox /opt/frappe-books/app.asar "$@"
fi
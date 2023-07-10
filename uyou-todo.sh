#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/uyou-todo/uyou-todo.asar "$@"
else
    exec electron --no-sandbox /opt/uyou-todo/uyou-todo.asar "$@"
fi
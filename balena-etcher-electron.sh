#!/bin/bash
ARGS="--no-sandbox"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    ARGS=""
fi
exec electron6 "${ARGS}" /usr/lib/balena-etcher "$@"

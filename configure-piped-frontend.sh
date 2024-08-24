#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: configure-piped-frontend HOSTNAME"
    exit 1
fi

sed -i s/pipedapi.kavin.rocks/"$1"/g DEST/*
nginx -g "daemon off;"

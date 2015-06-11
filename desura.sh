#!/bin/bash
export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH

if [[ ! -f "/opt/desura/desura" ]]; then
    LD_PRELOAD=libcurl.so.3 /opt/desura/bin/desura
    else
    LD_PRELOAD=libcurl.so.3 /opt/desura/desura
    fi
echo "If you don't see it. Maybe it minimized"

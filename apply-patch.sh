#!/bin/bash
set -e

REAL_LIB="/usr/lib/sane/libsane-brother5-real.so.1.0.7"
SANE_LIB="/usr/lib/sane/libsane-brother5.so.1.0.7"
SHIM_LIB="/usr/lib/brother5-longpaper/libbrother5_longpaper.so"

if [ ! -f "$SHIM_LIB" ]; then
    exit 0
fi

if [ -f "$SANE_LIB" ]; then
    SHIM_MD5=$(md5sum "$SHIM_LIB" | awk '{print $1}')
    CURR_MD5=$(md5sum "$SANE_LIB" | awk '{print $1}')
    if [ "$SHIM_MD5" != "$CURR_MD5" ]; then
        cp -a "$SANE_LIB" "$REAL_LIB"
        cp -f "$SHIM_LIB" "$SANE_LIB"
    fi
fi

#!/bin/bash
if [ -z "$ELECTRON_SSR_SCALE_FACTOR" ] ; then
    exec electron /opt/electron-ssr/main.js "$@"
else
    exec electron /opt/electron-ssr/main.js "$@" --force-device-scale-factor="$ELECTRON_SSR_SCALE_FACTOR"
fi
#!/bin/sh

env ELECTRON_FORCE_IS_PACKAGED=true electron21 /usr/lib/fluent-reader/app.asar "$@"

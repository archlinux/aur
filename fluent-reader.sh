#!/bin/sh

env ELECTRON_FORCE_IS_PACKAGED=true electron19 /usr/lib/fluent-reader/app.asar "$@"

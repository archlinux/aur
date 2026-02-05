#!/usr/bin/env bash

: ${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: ${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

exec electron39 "/usr/lib/ipfs-desktop/app.asar" "$@"

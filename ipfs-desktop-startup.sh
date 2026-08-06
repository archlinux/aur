#!/usr/bin/env bash

: "${ELECTRON_IS_DEV:=0}"
export ELECTRON_IS_DEV
: "${ELECTRON_FORCE_IS_PACKAGED:=true}"
export ELECTRON_FORCE_IS_PACKAGED

: "${IPFS_GO_EXEC:=/usr/bin/ipfs}"
export IPFS_GO_EXEC

exec @ELECTRON_PKG@ '/usr/lib/ipfs-desktop/app.asar' "$@"

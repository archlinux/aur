#!/usr/bin/env bash

: "${IPFS_DESKTOP_EXEC:=/usr/bin/ipfs-desktop}"
export IPFS_DESKTOP_EXEC

exec /opt/ipfs-desktop/ipfs-desktop "$@"

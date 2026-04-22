#!/bin/bash
# Per-user launcher for octra-wallet.
# The upstream binary reads ./static and writes ./data relative to cwd,
# so we pin cwd to an XDG data dir and symlink the read-only assets.
set -e

DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/octra-wallet"
mkdir -p "${DATA_DIR}/data"

if [[ ! -e "${DATA_DIR}/static" ]]; then
    ln -s /usr/share/octra-wallet/static "${DATA_DIR}/static"
fi

cd "${DATA_DIR}"
exec /usr/lib/octra-wallet/octra_wallet "$@"

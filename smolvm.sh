#!/bin/bash
# smolvm - OCI-native microVM runtime
# This wrapper sets up the library path and runs the smolvm binary.

set -e

# Resolve symlinks to get the actual script location
resolve_symlink() {
    local target="$1"
    while [[ -L "$target" ]]; do
        local link_dir
        link_dir="$(cd "$(dirname "$target")" && pwd)"
        target="$(readlink "$target")"
        # Handle relative symlinks
        if [[ "$target" != /* ]]; then
            target="$link_dir/$target"
        fi
    done
    echo "$target"
}

# Get the directory where the actual script lives (resolving symlinks)
SCRIPT_PATH="$(resolve_symlink "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

# The actual binary and libraries are in the same directory
SMOLVM_BIN="$SCRIPT_DIR/smolvm-bin"
SMOLVM_BUNDLED_ROOTFS="$SCRIPT_DIR/agent-rootfs"

if [[ -d "$SMOLVM_BUNDLED_ROOTFS" ]]; then
    export SMOLVM_AGENT_ROOTFS="${SMOLVM_AGENT_ROOTFS:-$SMOLVM_BUNDLED_ROOTFS}"
fi

export SMOLVM_AGENT_ROOTFS='/usr/lib/smolvm/agent-rootfs'

exec "$SMOLVM_BIN" "$@"

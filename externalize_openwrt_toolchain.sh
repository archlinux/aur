#!/bin/bash
set -euo pipefail

show_help() {
    cat <<EOF
Usage: $(basename "$0")

This script must be run inside an OpenWrt source tree.
It detects the configured target, looks up the external toolchain
mapping, and applies the external toolchain configuration.

No arguments are accepted.
EOF
}

cleanup() {
    [[ -n "${diffconfig:-}" && -f "$diffconfig" ]] && rm -f "$diffconfig"
}
trap cleanup EXIT

# --- Help text if script is called with any arguments ---
if [[ $# -ne 0 ]]; then
    show_help
    exit 1
fi

# --- Required files/directories ---
if [[ ! -f ".config" ]]; then
    echo ">>> No .config found."
    show_help
    exit 1
fi

if [[ ! -x "./scripts/diffconfig.sh" || ! -x "./scripts/ext-toolchain.sh" ]]; then
    echo ">>> This does not appear to be an OpenWrt source tree."
    show_help
    exit 1
fi


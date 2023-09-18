#!/bin/env bash

TARGET_DIR="$HOME/.local/share/cove"
SOURCE_DIR="/opt/cove"

# cove creates a bunch of files in place
# this is a workaround
mkdir -p "${TARGET_DIR}" &>/dev/null
cd "${TARGET_DIR}" && exec "${SOURCE_DIR}/cove" "$@"

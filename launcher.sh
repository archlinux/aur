#!/bin/env bash

TARGET_DIR="$HOME/.local/cove"
SOURCE_DIR="/opt/cove"

# cove creates a bunch of files in place
# this is a workaround
cd "${TARGET_DIR}" && exec "${SOURCE_DIR}/cove" "$@"

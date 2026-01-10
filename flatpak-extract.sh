#!/bin/bash

set -e

if ! command -v ostree &> /dev/null; then
    echo "Command 'ostree' not found"
    exit 1
fi

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: flatpak-extract <filename> [output-directory]"
    exit 1
fi

FILENAME="$1"
INPUT_FILE=$(readlink -f "$FILENAME")

if [ ! -f "$INPUT_FILE" ]; then
    echo "Input file not found"
    exit 1
fi

OUTPUT_DIRECTORY="${2:-extracted}"
TEMP_DIRECTORY="/tmp/flatpak-extract-tmp"

rm -rf "$TEMP_DIRECTORY" "$OUTPUT_DIRECTORY"

ostree init --repo="$TEMP_DIRECTORY" --mode=bare-user
ostree static-delta apply-offline --repo="$TEMP_DIRECTORY" "$INPUT_FILE"

COMMIT_FILE=$(find "$TEMP_DIRECTORY/objects" -name "*.commit" | head -n 1)
if [ -z "$COMMIT_FILE" ]; then
    echo "Could not determine commit hash"
    exit 1
fi

COMMIT_HASH="$(basename "$(dirname "$COMMIT_FILE")")$(basename "$COMMIT_FILE" .commit)"

ostree checkout --repo="$TEMP_DIRECTORY" -U "$COMMIT_HASH" "$OUTPUT_DIRECTORY"
rm -rf "$TEMP_DIRECTORY"

#!/usr/bin/env bash

# Script to clear fd_cache for rofi-file-selector
# Removes cached file listings from the fd_cache system

: "${XDG_CACHE_HOME:="$HOME/.cache"}"
: "${CACHEDIR:="$XDG_CACHE_HOME/fd_cache"}"

if [[ ! -d "$CACHEDIR" ]]; then
    echo "Cache directory does not exist: $CACHEDIR"
    exit 0
fi

echo "Removing fd_cache directory: $CACHEDIR"
rm -rf "$CACHEDIR"

if [[ $? -eq 0 ]]; then
    echo "Cache successfully removed."
else
    echo "Error: Failed to remove cache directory."
    exit 1
fi
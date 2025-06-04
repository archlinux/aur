#!/usr/bin/env bash

# Find the latest available electronXX (or electronXXX...) binary
latest=$(compgen -c | grep -E '^electron[0-9]+$' | sort -V | tail -n1)

if [[ -z "$latest" ]]; then
    echo "No electronXX binary found." >&2
    exit 1
fi

exec "$latest" "$@"

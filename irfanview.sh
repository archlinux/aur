#!/bin/bash

if ! command -v wine &> /dev/null; then
    echo "Error: 'wine' is not installed. Please install it to run IrfanView." >&2
    exit 1
fi

args=()
for arg in "$@"; do
    if [ -e "$arg" ]; then
        args+=("$(winepath -w "$arg")")
    else
        args+=("$arg")
    fi
done

exec wine /opt/irfanview/i_view64.exe "${args[@]}"

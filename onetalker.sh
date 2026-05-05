#!/bin/sh

if [ ! -d "$HOME/.local/share/onetalker/assets" ]; then
    mkdir -p "$HOME/.local/share/onetalker"
    cp -r /usr/share/onetalker/assets "$HOME/.local/share/onetalker"
fi

RUST_LOG=onetalker=warn exec /opt/onetalker/onetalker "$@"

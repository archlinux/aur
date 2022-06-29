#!/bin/sh

DIR="$HOME/.config/itch/prereqs/firejail-amd64"
mkdir -p "$DIR"
ln -sf /usr/bin/firejail "$DIR/firejail"

exec electron11 /usr/share/itch "$@"
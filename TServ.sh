#!/bin/bash

set -eu

HOME_DIR="$HOME"/.local/share/tserv

mkdir -p "$HOME_DIR"

cd "$HOME_DIR"

/usr/bin/TServ

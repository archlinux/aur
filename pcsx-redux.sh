#!/bin/sh

DATADIR="$HOME/.pcsx-redux"
mkdir -p "$DATADIR"
cd "$DATADIR" && /opt/pcsx-redux/pcsx-redux "$@"
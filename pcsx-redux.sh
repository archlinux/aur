#!/bin/sh

INSTALLDIR="$HOME/.pcsx-redux"
mkdir -p "$INSTALLDIR"
ln -sf /usr/share/pcsx-redux/pcsx-redux "$INSTALLDIR/pcsx-redux"
cd "$INSTALLDIR" && ./pcsx-redux
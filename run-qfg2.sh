#!/bin/sh
set -e
homedir="$HOME/.local/share/gog/qfg"
gogdir="/opt/gog/qfg2"
rundir="$XDG_RUNTIME_DIR/gog/qfg2"
mkdir -p "$homedir"
mkdir -p "$rundir"
/usr/bin/unionfs "$homedir=RW:$gogdir=RO" "$rundir"
cd "$rundir"
/usr/bin/dosbox -conf "$gogdir/dosboxQG2.conf" -conf "$gogdir/run-qfg2.conf"
cd "$gogdir"
/usr/bin/fusermount -u "$rundir"

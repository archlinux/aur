#!/bin/sh
set -e
homedir="$HOME/.local/share/gog/qfg"
gogdir="/opt/gog/qfg1"
rundir="$XDG_RUNTIME_DIR/gog/qfg1"
mkdir -p "$homedir"
mkdir -p "$rundir"
/usr/bin/unionfs "$homedir=RW:$gogdir=RO" "$rundir"
cd "$rundir"
/usr/bin/dosbox -conf "$gogdir/dosboxQG1VGA.conf" -conf "$gogdir/run-qfg1.conf"
cd "$gogdir"
/usr/bin/fusermount -u "$rundir"

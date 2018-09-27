#!/bin/sh
export BINDIR="/usr/share/filr-client/"
exec python2 -m novel_filr.filr "$@"

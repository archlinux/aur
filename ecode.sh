#!/bin/sh
DIRPATH="/opt/ecode-bin"

LD_LIBRARY_PATH="$DIRPATH/libs" "$DIRPATH/ecode.bin" "$@"

#!/bin/sh
if [ "$CARGO_PKG_NAME" = "aws-lc-sys" ]; then
    exec "${ORIG_CC}" "$@" -O0
fi
exec "${ORIG_CC}" "$@"

#!/bin/sh
set -eu

appdir=/usr/lib/baidunetdisk
export LD_LIBRARY_PATH="$appdir/legacy-libs${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$appdir/baidunetdisk" --no-sandbox "$@"

#!/bin/sh
set -eu

exec /usr/lib/baidunetdisk/baidunetdisk --no-sandbox "$@"

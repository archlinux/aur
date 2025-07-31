#!/bin/bash
set -euo pipefail

: "${SOURCE:=/var/lib/s3-syncer}"
: "${TARGET:?Target must be specified in config.env}"

echo "[$(date)] Starting sync: $SOURCE -> $TARGET"
exec rclone sync "$SOURCE" "$TARGET" \
    --fast-list \
    --progress \
    --stats=1s \
    --combined=/var/log/s3-syncer/rclone-combined.log \
    --log-level=INFO \
    --syslog

#!/bin/bash
set -euo pipefail

: "${SOURCE:=/var/lib/s3-syncer}"
: "${TARGET:?Target must be specified in config.env}"

echo "[$(date)] Starting sync: $SOURCE -> $TARGET"
exec rclone sync "$SOURCE" "$TARGET" "$RCLONE_OPTIONS" \
    --fast-list \
    --stats=1s \
    --combined=/var/log/s3-syncer/rclone-combined.log \
    --log-level=INFO \
    --syslog

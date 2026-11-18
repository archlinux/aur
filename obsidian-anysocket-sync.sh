#!/bin/sh
# Device management for the packaged server (approve, revoke, remove, list).
# Run as root it switches to the service user, so offline edits keep the data
# directory owned by the service.
: "${ANYSOCKET_SYNC_CONFIG:=/etc/obsidian-anysocket-sync-server/config.js}"
: "${ANYSOCKET_SYNC_DATA:=/var/lib/obsidian-anysocket-sync-server}"
export ANYSOCKET_SYNC_CONFIG ANYSOCKET_SYNC_DATA
cli=/usr/lib/obsidian-anysocket-sync-server/cli.js
if [ "$(id -u)" -eq 0 ]; then
    exec runuser -u anysocket-sync -- /usr/bin/node "$cli" "$@"
fi
exec /usr/bin/node "$cli" "$@"

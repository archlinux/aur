#!/bin/bash
# Reload live user managers as root; all migration work runs as the user.
set -u
export PATH=/usr/bin LC_ALL=C
log() { printf 'owlry-user-migrate: %s\n' "$*" >&2; }
failed=0
seen=0

for runtime in /run/user/[0-9]*; do
    uid=${runtime##*/}
    [[ "$uid" =~ ^[1-9][0-9]*$ ]] || continue
    [[ -d "$runtime" && ! -L "$runtime" ]] || continue
    manager_state=$(/usr/bin/timeout -k 2 5 /usr/bin/systemctl --system show "user@$uid.service" -p ActiveState --value) || {
        log "user $uid: cannot determine manager state"
        failed=1
        continue
    }
    [[ "$manager_state" == active ]] || continue
    [[ "$(/usr/bin/timeout -k 2 5 /usr/bin/stat -c %u "$runtime")" == "$uid" &&
        "$(/usr/bin/timeout -k 2 5 /usr/bin/stat -c %F "$runtime/bus")" == socket ]] || {
        log "user $uid: active manager has no usable runtime bus"
        failed=1
        continue
    }
    entry=$(/usr/bin/timeout -k 2 5 /usr/bin/getent passwd "$uid") || {
        log "user $uid: passwd lookup failed"
        failed=1
        continue
    }
    IFS=: read -r name _ account_uid _ _ _ _ <<<"$entry"
    [[ -n "$name" && "$account_uid" == "$uid" ]] || { failed=1; continue; }
    seen=1
    log "user $uid ($name): daemon-reload"
    if ! /usr/bin/timeout -k 2 15 /usr/bin/runuser -u "$name" -- /usr/bin/env -i \
        PATH=/usr/bin LC_ALL=C "XDG_RUNTIME_DIR=$runtime" \
        "DBUS_SESSION_BUS_ADDRESS=unix:path=$runtime/bus" \
        /usr/bin/systemctl --user daemon-reload; then
        log "user $uid ($name): daemon-reload failed or timed out"
        failed=1
        continue
    fi
    log "user $uid ($name): start owlry-user-migrate.service"
    if ! /usr/bin/timeout -k 2 110 /usr/bin/runuser -u "$name" -- /usr/bin/env -i \
        PATH=/usr/bin LC_ALL=C "XDG_RUNTIME_DIR=$runtime" \
        "DBUS_SESSION_BUS_ADDRESS=unix:path=$runtime/bus" \
        /usr/bin/systemctl --user start owlry-user-migrate.service; then
        log "user $uid ($name): migration failed or timed out"
        failed=1
    fi
done

if (( failed )); then
    log "one or more users could not be migrated; retry the migration unit as the affected user"
    exit 1
fi
if (( seen )); then
    log "all running user managers checked"
else
    log "no running user manager; nothing to do"
fi

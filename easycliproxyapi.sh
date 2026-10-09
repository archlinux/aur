#!/usr/bin/env bash
set -euo pipefail

LIB_DIR="/usr/lib/easycliproxyapi"
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/easycliproxyapi"

mkdir -p "$USER_DIR/cpa-core"

# Serialize startup syncs, but release the lock before running the application.
exec 9> "$USER_DIR/.package-sync.lock"
flock -x 9
sync_tmp=''
trap 'if [[ -n "$sync_tmp" ]]; then rm -f -- "$sync_tmp"; fi' EXIT

sync_file() {
    local source="$1" destination="$2" mode="$3"
    if [[ -f "$destination" ]] && cmp -s -- "$source" "$destination"; then
        chmod "$mode" "$destination"
        return
    fi
    sync_tmp=$(mktemp "${destination}.sync.XXXXXX")
    cp -- "$source" "$sync_tmp"
    chmod "$mode" "$sync_tmp"
    mv -fT -- "$sync_tmp" "$destination"
    sync_tmp=''
}

read_version() {
    local json_file="$1"
    if [[ -f "$json_file" ]]; then
        sed -n 's/.*"version":[[:space:]]*"\([^"]*\)".*/\1/p' "$json_file" | head -n 1
    fi
}

USER_MANIFEST="$USER_DIR/portable-app.json"
LIB_MANIFEST="$LIB_DIR/portable-app.json"

USER_VER=$(read_version "$USER_MANIFEST")
LIB_VER=$(read_version "$LIB_MANIFEST")

# Decide whether to sync:
# Sync if user executable does not exist, or user version is unrecognized,
# or system version is strictly newer than user version (e.g. system update).
# If user version >= system version (e.g. in-app portable update), do not overwrite user files.
SHOULD_SYNC=0
if [[ ! -f "$USER_DIR/EasyCLIProxyAPI" || -z "$USER_VER" ]]; then
    SHOULD_SYNC=1
elif [[ -n "$LIB_VER" ]]; then
    HIGHEST_VER=$(printf '%s\n%s\n' "$LIB_VER" "$USER_VER" | sort -V | tail -n 1)
    if [[ "$HIGHEST_VER" == "$LIB_VER" && "$LIB_VER" != "$USER_VER" ]]; then
        SHOULD_SYNC=1
    fi
fi

if [[ "$SHOULD_SYNC" -eq 1 ]]; then
    sync_file "$LIB_DIR/EasyCLIProxyAPI" "$USER_DIR/EasyCLIProxyAPI" 755
    sync_file "$LIB_DIR/core-version.txt" "$USER_DIR/core-version.txt" 644
    sync_file "$LIB_DIR/portable-app.json" "$USER_DIR/portable-app.json" 644
    for source in "$LIB_DIR"/cpa-core/*; do
        [[ -f "$source" ]] || continue
        sync_file "$source" "$USER_DIR/cpa-core/${source##*/}" 644
    done
fi

flock -u 9
exec 9>&-
trap - EXIT
cd "$USER_DIR"
exec "$USER_DIR/EasyCLIProxyAPI" "$@"

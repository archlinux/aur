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
    # Package timestamps can be older than a user copy (including downgrades).
    if [[ -f "$destination" ]] && cmp -s -- "$source" "$destination"; then
        chmod "$mode" "$destination"
        return
    fi
    sync_tmp=$(mktemp "${destination}.sync.XXXXXX")
    cp -- "$source" "$sync_tmp"
    chmod "$mode" "$sync_tmp"
    # Same-directory rename is atomic and does not overwrite a running inode.
    mv -fT -- "$sync_tmp" "$destination"
    sync_tmp=''
}

sync_file "$LIB_DIR/EasyCLIProxyAPI" "$USER_DIR/EasyCLIProxyAPI" 755
sync_file "$LIB_DIR/core-version.txt" "$USER_DIR/core-version.txt" 644
sync_file "$LIB_DIR/portable-app.json" "$USER_DIR/portable-app.json" 644
for source in "$LIB_DIR"/cpa-core/*; do
    [[ -f "$source" ]] || continue
    sync_file "$source" "$USER_DIR/cpa-core/${source##*/}" 644
done

# Only package-managed files are touched; preserve user settings and core data.
flock -u 9
exec 9>&-
trap - EXIT
cd "$USER_DIR"
exec "$USER_DIR/EasyCLIProxyAPI" "$@"

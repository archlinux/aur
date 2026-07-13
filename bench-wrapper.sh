#!/usr/bin/env bash
# Pilot needs its install directory writable: benches, the admin venv and
# downloaded assets all live next to its code. Keep a per-user copy of the
# packaged tree in sync and run from there. Benches and the admin venv are
# excluded from --delete, so user state survives package upgrades.
set -euo pipefail

share="/usr/share/frappe-pilot"
home="${PILOT_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/frappe-pilot}"
stamp="${home}/.pkgver"

# A git checkout (e.g. PILOT_HOME pointing at a clone for pilot development)
# is run as-is, never synced over.
if [[ -e "${home}/.git" ]]; then
    exec "${home}/bench" "$@"
fi

if [[ ! -f "${stamp}" || "$(cat "${stamp}")" != "$(cat "${share}/.pkgver")" ]]; then
    mkdir -p "${home}"
    rsync -a --delete \
        --exclude "benches" \
        --exclude ".admin-venv" \
        --exclude ".pkgver" \
        "${share}/" "${home}/"
    cp "${share}/.pkgver" "${stamp}"
fi

exec "${home}/bench" "$@"

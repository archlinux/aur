#!/usr/bin/bash

# Avvio di Outlinux con l'Electron di sistema.
#
# I flag di piattaforma vanno calcolati qui: `--ozone-platform` viene letto da
# Chromium all'avvio, prima che il processo principale possa impostarlo. Così
# l'app non deve riavviarsi da sola e i log restano attaccati al terminale.
#
# Flag aggiuntivi: una opzione per riga in ~/.config/outlinux-flags.conf

set -euo pipefail

_APP_DIR=/usr/lib/outlinux
_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
_FLAGS_FILE="${_CONFIG_DIR}/outlinux-flags.conf"
_SETTINGS="${_CONFIG_DIR}/Outlinux/settings.json"

flags=()

# Wayland nativo, indispensabile per lo scaling frazionario degli schermi HiDPI.
if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    if ! [[ -f "${_SETTINGS}" ]] || ! grep -Eq '"displayBackend"[[:space:]]*:[[:space:]]*"x11"' "${_SETTINGS}"; then
        flags+=('--ozone-platform=wayland')
    fi
fi

if [[ -f "${_FLAGS_FILE}" ]]; then
    while IFS= read -r line; do
        [[ -z "${line}" || "${line}" =~ ^[[:space:]]*# ]] && continue
        flags+=("${line}")
    done < "${_FLAGS_FILE}"
fi

exec /usr/bin/electron "${_APP_DIR}" "${flags[@]}" "$@"

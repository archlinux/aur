#!/usr/bin/env bash
set -euo pipefail

PKG_NAME="codex-app-electron-port-bin"

usage() {
  cat <<'EOF'
Usage:
  codex-app-electron-port-bin-autoupdate [--check]

Options:
  --check   Only report whether an update is available.
EOF
}

pick_helper() {
  if command -v paru >/dev/null 2>&1; then
    echo "paru"
    return
  fi
  if command -v yay >/dev/null 2>&1; then
    echo "yay"
    return
  fi
  return 1
}

has_update() {
  local helper="$1"
  "${helper}" -Qua "${PKG_NAME}" 2>/dev/null | grep -q "^${PKG_NAME}[[:space:]]"
}

do_update() {
  local helper="$1"
  case "${helper}" in
    paru)
      exec paru -S "${PKG_NAME}"
      ;;
    yay)
      exec yay -S "${PKG_NAME}"
      ;;
    *)
      echo "Unsupported helper: ${helper}" >&2
      exit 1
      ;;
  esac
}

main() {
  local mode="update"

  if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    usage
    return 0
  fi
  if [[ "${1:-}" == "--check" ]]; then
    mode="check"
  elif [[ -n "${1:-}" ]]; then
    echo "Unknown option: ${1}" >&2
    usage >&2
    return 1
  fi

  local helper
  if ! helper="$(pick_helper)"; then
    cat >&2 <<'EOF'
No supported AUR helper found.
Install `paru` or `yay` and retry.
EOF
    return 1
  fi

  if has_update "${helper}"; then
    if [[ "${mode}" == "check" ]]; then
      echo "Update available for ${PKG_NAME}."
      return 0
    fi
    echo "Updating ${PKG_NAME} via ${helper}..."
    do_update "${helper}"
  else
    echo "${PKG_NAME} is already up to date."
    return 0
  fi
}

main "$@"

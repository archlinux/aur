#!/usr/bin/env bash

set -euo pipefail

PKGNAME="codex-plus-plus"
UPSTREAM_BIN="/usr/bin/codex-desktop"
INJECTED_BIN="/usr/lib/${PKGNAME}/bin/codex-desktop-injected"
BACKUP_DIR="/usr/lib/${PKGNAME}/upstream"
BACKUP_BIN="${BACKUP_DIR}/codex-desktop"
STATE_DIR="/var/lib/${PKGNAME}"
STATE_FILE="${STATE_DIR}/state"
DEFAULT_STATE="enabled"

require_root() {
  if (( EUID != 0 )); then
    echo "This command must run as root." >&2
    exit 1
  fi
}

ensure_state_dir() {
  install -dm755 "${STATE_DIR}" "${BACKUP_DIR}"
}

save_state() {
  local value="$1"

  ensure_state_dir
  printf '%s\n' "${value}" > "${STATE_FILE}"
}

read_state() {
  if [[ -f "${STATE_FILE}" ]]; then
    cat "${STATE_FILE}"
    return
  fi

  printf '%s\n' "${DEFAULT_STATE}"
}

is_injected() {
  [[ -L "${UPSTREAM_BIN}" ]] && [[ "$(readlink -f "${UPSTREAM_BIN}")" == "$(readlink -f "${INJECTED_BIN}")" ]]
}

backup_current_upstream() {
  if [[ ! -e "${UPSTREAM_BIN}" ]]; then
    echo "Missing upstream launcher: ${UPSTREAM_BIN}" >&2
    exit 1
  fi

  if is_injected; then
    return
  fi

  install -Dm755 "${UPSTREAM_BIN}" "${BACKUP_BIN}"
}

enable_injection() {
  require_root
  ensure_state_dir

  if [[ ! -x "${INJECTED_BIN}" ]]; then
    echo "Injected launcher not found: ${INJECTED_BIN}" >&2
    exit 1
  fi

  backup_current_upstream
  ln -sfnT "${INJECTED_BIN}" "${UPSTREAM_BIN}"
  save_state enabled
  echo "Codex++ injection enabled."
}

disable_injection() {
  require_root
  ensure_state_dir

  if [[ ! -f "${BACKUP_BIN}" ]]; then
    echo "Backup launcher not found: ${BACKUP_BIN}" >&2
    echo "Reinstall openai-codex-desktop to restore the upstream launcher." >&2
    exit 1
  fi

  rm -f "${UPSTREAM_BIN}"
  install -Dm755 "${BACKUP_BIN}" "${UPSTREAM_BIN}"
  save_state disabled
  echo "Codex++ injection disabled."
}

print_status() {
  local configured
  local active

  configured="$(read_state)"
  if is_injected; then
    active="enabled"
  else
    active="disabled"
  fi

  printf 'configured=%s\n' "${configured}"
  printf 'active=%s\n' "${active}"
  printf 'launcher=%s\n' "${UPSTREAM_BIN}"
  printf 'injected_target=%s\n' "${INJECTED_BIN}"
}

reapply_if_enabled() {
  require_root

  if [[ "$(read_state)" != "enabled" ]]; then
    exit 0
  fi

  enable_injection
}

run_injected() {
  exec /usr/lib/${PKGNAME}/bin/codex-plus-plus-upstream \
    --app-path /usr/lib/${PKGNAME}/app "$@"
}

usage() {
  cat <<'EOF'
Usage:
  codex-plus-plus enable
  codex-plus-plus disable
  codex-plus-plus status
  codex-plus-plus run [codex args...]
  codex-plus-plus hook-reapply
EOF
}

main() {
  local command="${1:-status}"
  local self_name

  self_name="$(basename "$0")"
  if [[ "${self_name}" == "codex-desktop" || "${self_name}" == "codex-desktop-injected" ]]; then
    run_injected "$@"
  fi

  case "${command}" in
    enable)
      enable_injection
      ;;
    disable)
      disable_injection
      ;;
    status)
      print_status
      ;;
    run)
      shift
      run_injected "$@"
      ;;
    hook-reapply)
      reapply_if_enabled
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"

#!/usr/bin/env bash

set -euo pipefail

PKGNAME="codex-plus-plus"
UPSTREAM_BIN="/usr/bin/chatgpt"
INJECTED_BIN="/usr/lib/${PKGNAME}/bin/chatgpt-injected"
BACKUP_DIR="/usr/lib/${PKGNAME}/upstream"
BACKUP_BIN="${BACKUP_DIR}/chatgpt"
LEGACY_UPSTREAM_BIN="/usr/bin/codex-desktop"
LEGACY_INJECTED_BIN="/usr/lib/${PKGNAME}/bin/codex-desktop-injected"
STATE_DIR="/var/lib/${PKGNAME}"
STATE_FILE="${STATE_DIR}/state"
DEFAULT_STATE="disabled"

launcher_processes() {
  pgrep -f "^/usr/lib/${PKGNAME}/bin/codex-plus-plus-upstream( |$)" 2>/dev/null || true
}

codex_app_processes() {
  pgrep -f "^/bin/bash ${UPSTREAM_BIN}( |$)" 2>/dev/null || true
  pgrep -f "^/bin/bash ${BACKUP_BIN}( |$)" 2>/dev/null || true
  pgrep -f "^/usr/lib/chatgpt/ChatGPT( |$)" 2>/dev/null || true
}

process_tree() {
  local pid="$1"
  local child

  while IFS= read -r child; do
    [[ -n "${child}" ]] || continue
    process_tree "${child}"
  done < <(pgrep -P "${pid}" 2>/dev/null || true)

  printf '%s\n' "${pid}"
}

stop_process_roots() {
  local root_pid
  local target_pid
  local targets=()

  while IFS= read -r root_pid; do
    [[ -n "${root_pid}" ]] || continue
    [[ "${root_pid}" == "$$" ]] && continue
    while IFS= read -r target_pid; do
      [[ -n "${target_pid}" ]] || continue
      targets+=("${target_pid}")
    done < <(process_tree "${root_pid}")
  done

  ((${#targets[@]} > 0)) || return 0
  mapfile -t targets < <(printf '%s\n' "${targets[@]}" | awk '!seen[$0]++')

  for target_pid in "${targets[@]}"; do
    kill -TERM "${target_pid}" 2>/dev/null || true
  done

  for _ in {1..30}; do
    local any_running=0
    for target_pid in "${targets[@]}"; do
      if kill -0 "${target_pid}" 2>/dev/null; then
        any_running=1
        break
      fi
    done
    ((any_running == 0)) && return 0
    sleep 0.1
  done

  for target_pid in "${targets[@]}"; do
    kill -KILL "${target_pid}" 2>/dev/null || true
  done
}

stop_running_launchers() {
  stop_process_roots < <(launcher_processes)
}

stop_running_codex_apps() {
  stop_process_roots < <(codex_app_processes)
}

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

restore_legacy_injection() {
  local legacy_target

  [[ -L "${LEGACY_UPSTREAM_BIN}" ]] || return 0
  legacy_target="$(readlink "${LEGACY_UPSTREAM_BIN}" 2>/dev/null || true)"
  [[ "${legacy_target}" == "${LEGACY_INJECTED_BIN}" ]] || return 0

  if [[ -e "${UPSTREAM_BIN}" || -L "${UPSTREAM_BIN}" ]]; then
    ln -sfnT chatgpt "${LEGACY_UPSTREAM_BIN}"
  fi
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
  stop_running_launchers
  stop_running_codex_apps
  restore_legacy_injection

  apply_injection
}

apply_injection() {
  require_root
  ensure_state_dir

  if [[ ! -x "${INJECTED_BIN}" ]]; then
    echo "Injected launcher not found: ${INJECTED_BIN}" >&2
    exit 1
  fi

  backup_current_upstream
  ln -sfnT "${INJECTED_BIN}" "${UPSTREAM_BIN}"
  save_state enabled
  echo "Codex++ injection applied."
}

disable_injection() {
  require_root
  ensure_state_dir
  stop_running_launchers
  stop_running_codex_apps
  restore_legacy_injection

  if ! is_injected; then
    save_state disabled
    echo "Codex++ injection is already disabled."
    return
  fi

  if [[ ! -f "${BACKUP_BIN}" ]]; then
    echo "Backup launcher not found: ${BACKUP_BIN}" >&2
    echo "Reinstall the package that provides 'chatgpt' to restore the upstream launcher." >&2
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

  apply_injection
}

run_injected() {
  stop_running_launchers
  stop_running_codex_apps
  exec /usr/lib/${PKGNAME}/bin/codex-plus-plus-upstream \
    --app-path /usr/lib/${PKGNAME}/app "$@"
}

usage() {
  cat <<'EOF'
Usage:
  codex-plus-plus enable
  codex-plus-plus apply
  codex-plus-plus disable
  codex-plus-plus status
  codex-plus-plus stop
  codex-plus-plus run [chatgpt args...]
  codex-plus-plus hook-reapply
EOF
}

main() {
  local command="${1:-status}"
  local self_name

  self_name="$(basename "$0")"
  if [[ "${self_name}" == "chatgpt" || "${self_name}" == "chatgpt-injected" || "${self_name}" == "codex-desktop" || "${self_name}" == "codex-desktop-injected" ]]; then
    run_injected "$@"
  fi

  case "${command}" in
    enable)
      enable_injection
      ;;
    apply)
      apply_injection
      ;;
    disable)
      disable_injection
      ;;
    status)
      print_status
      ;;
    stop)
      stop_running_launchers
      stop_running_codex_apps
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

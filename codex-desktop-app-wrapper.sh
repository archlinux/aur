#!/usr/bin/env bash

set -euo pipefail

PKGNAME="codex-plus-plus"
BACKUP_LAUNCHER="${CODEXPP_CHATGPT_LAUNCHER:-${CODEXPP_OPENAI_CODEX_LAUNCHER:-/usr/lib/${PKGNAME}/upstream/chatgpt}}"
SYSTEM_LAUNCHER="${CODEXPP_CHATGPT_SYSTEM_LAUNCHER:-/usr/bin/chatgpt}"
INJECTED_LAUNCHER="${CODEXPP_CHATGPT_INJECTED_LAUNCHER:-/usr/lib/${PKGNAME}/bin/chatgpt-injected}"
CHATGPT_BIN="${CODEXPP_CHATGPT_BIN:-/usr/lib/chatgpt/ChatGPT}"

is_injected_launcher() {
  local candidate="$1"
  local candidate_target
  local injected_target

  [[ -e "${candidate}" || -L "${candidate}" ]] || return 1
  candidate_target="$(readlink -f "${candidate}" 2>/dev/null || true)"
  injected_target="$(readlink -f "${INJECTED_LAUNCHER}" 2>/dev/null || true)"
  [[ -n "${candidate_target}" && -n "${injected_target}" && "${candidate_target}" == "${injected_target}" ]]
}

if [[ -x "${SYSTEM_LAUNCHER}" ]] && ! is_injected_launcher "${SYSTEM_LAUNCHER}"; then
  exec "${SYSTEM_LAUNCHER}" "$@"
fi

if [[ -x "${BACKUP_LAUNCHER}" ]]; then
  exec "${BACKUP_LAUNCHER}" "$@"
fi

if [[ -x "${CHATGPT_BIN}" ]]; then
  exec "${CHATGPT_BIN}" "$@"
fi

echo "ChatGPT launcher not found. Install a package that provides 'chatgpt'." >&2
exit 1

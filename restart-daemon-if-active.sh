#!/bin/sh
set -eu

UNIT="lattice-daemon.service"
HELPER_TAG="[lattice-package]"

restart_system_service_if_active() {
  if ! command -v systemctl >/dev/null 2>&1; then
    return 0
  fi

  systemctl daemon-reload >/dev/null 2>&1 || true

  if systemctl is-active --quiet "$UNIT" 2>/dev/null; then
    echo "$HELPER_TAG restarting active system service: $UNIT"
    systemctl restart "$UNIT"
  fi
}

restart_user_services_if_active() {
  if ! command -v systemctl >/dev/null 2>&1 || ! command -v loginctl >/dev/null 2>&1; then
    return 0
  fi

  logins="$(loginctl list-users --no-legend 2>/dev/null || true)"
  [ -n "$logins" ] || return 0

  printf '%s\n' "$logins" | while IFS= read -r line; do
    [ -n "$line" ] || continue
    user="$(printf '%s\n' "$line" | awk '{print $2}')"
    [ -n "$user" ] || continue

    machine="${user}@.host"
    if systemctl --machine="$machine" --user is-active --quiet "$UNIT" 2>/dev/null; then
      echo "$HELPER_TAG restarting active user service: $UNIT for $user"
      systemctl --machine="$machine" --user daemon-reload >/dev/null 2>&1 || true
      systemctl --machine="$machine" --user restart "$UNIT"
    fi
  done
}

restart_system_service_if_active
restart_user_services_if_active

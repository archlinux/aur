#!/bin/bash
# based on https://github.com/archlinux/svntogit-community/tree/packages/profile-sync-daemon/trunk 
# shellcheck disable=SC2016 # don't wish them to expand

basename=reminders

# users=($(loginctl --no-legend list-users | awk '{ print $2 }' | sed ':a;N;$!ba'))
mapfile -t users < <(loginctl --no-legend list-users | awk '{ print $2 }' | sed ':a;N;$!ba')

# pre_install() {
# }

# post_install() {
# }

pre_upgrade() {
  # stop system service now since it will be removed upon updating
  if systemctl is-active "${basename}.service" &>/dev/null; then
    systemctl stop "${basename}.service" &>/dev/null
  fi
}

post_upgrade() {
  _daemon_refresh
}

pre_remove() {
  for user in "${users[@]}"; do
    if _daemon_user_check "$user"; then
      _daemon_user_stop "$user"
    fi
  done
}

# post_remove() {
# }

_daemon_refresh() {
  for user in "${users[@]}"; do
    su "$user" -s /bin/sh -c 'XDG_RUNTIME_DIR=/run/user/$UID systemctl --user daemon-reload'
  done
}

_daemon_user_check() {
  running="$(su "$1" -s /bin/sh -c "XDG_RUNTIME_DIR=/run/user/'$UID' systemctl --user is-active $basename")"
  if [[ "$running" = "active" ]]; then
    return 0
  else
    return 1
  fi
}

_daemon_user_stop() {
  su "$1" -s /bin/sh -c "XDG_RUNTIME_DIR=/run/user/'$UID' systemctl --user stop $basename.service"
}

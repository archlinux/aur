_tp_config="/etc/advttyd.conf"
_tp_configps="${_tp_config}.pacsave"

post_upgrade() {
  set -u
  #systemctl daemon-reload # handled by pacman hook
  # Handle the module update when not using DKMS
  if [ "${_opt_DKMS}" -eq 0 ] && [ "${_opt_AutoRestart}" -ne 0 ]; then
    # depmod -a # now done by a pacman hook
    if systemctl -q is-enabled 'advtty-vcom.service'; then
      #systemctl restart 'advtty-vcom.service'
      # Executed by 35-systemd-enqueue-marked.hook, too early for DKMS
      systemctl set-property 'advtty-vcom.service' Markers='needs-restart'
    fi
  fi
  set +u
}

post_install() {
  set -u
  if [ -f "${_tp_config}" ] && [ -f "${_tp_configps}" ] && ! grep -q '^[0-9]' "${_tp_config}" && grep -q '^[0-9]' "${_tp_configps}"; then
    mv "${_tp_configps}" "${_tp_config}"
  fi
  set +u
  post_upgrade
  if systemctl -q is-enabled 'advtty-vcom.service' && ! systemctl -q is-active 'advtty-vcom.service'; then
    # We can't auto start the service because DKMS hasn't made the module yet
    echo 'Please start the service with'
    echo "  systemctl start 'advtty-vcom.service'"
  fi
}

pre_upgrade() {
  set -u
  if [ "${_opt_DKMS}" -eq 0 ] && [ "${_opt_AutoRestart}" -ne 0 ]; then
    systemctl stop 'advtty-vcom.service' # also rmmod the module
  fi
  set +u
}

pre_remove() {
  set -u
  systemctl stop 'advtty-vcom.service' # pre_upgrade
  # Unfortunately this when blank is changed after install which makes pacman think that it needs to be saved
  if ! grep -q '^[0-9]' "${_tp_config}"; then
    rm -f "${_tp_config}"
  fi
  set +u
}

post_remove() {
  set -u
  #systemctl daemon-reload
  set +u
}

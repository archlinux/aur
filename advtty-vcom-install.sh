_tp_config="/etc/advttyd.conf"
_tp_configps="${_tp_config}.pacsave"

post_upgrade() {
  set -u
  systemctl daemon-reload
  # Handle the module update if DKMS doesn't
  if [ ! -d /usr/src/advtty-vcom-*/ ]; then
    # depmod -a # now done by a pacman hook
    if systemctl -q is-enabled 'advtty-vcom.service'; then
      systemctl start 'advtty-vcom.service'
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
  if [ ! -d /usr/src/advtty-vcom-*/ ]; then
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
  systemctl daemon-reload
  set +u
}

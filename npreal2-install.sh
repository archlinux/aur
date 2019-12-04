_tp_config="/etc/npreal2/npreal2d.cf"
_tp_configps="${_tp_config}.pacsave"
#_tp_log='/var/log/npreal2d.log'

post_upgrade() {
  set -u
  systemctl daemon-reload
  # Handle the module update if DKMS doesn't
  if [ ! -d /usr/src/npreal2-*/ ]; then
    depmod -a
    if systemctl -q is-enabled 'npreal2.service'; then
      systemctl start 'npreal2.service'
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
  if systemctl -q is-enabled 'npreal2.service' && ! systemctl -q is-active 'npreal2.service'; then
    # We can't auto start the service because DKMS hasn't made the module yet
    echo 'Please start the service with'
    echo "  systemctl start 'npreal2.service'"
  fi
}

pre_upgrade() {
  set -u
  if [ ! -d /usr/src/npreal2-*/ ]; then
    systemctl stop 'npreal2.service' # also rmmod the module
  fi
  set +u
}

pre_remove() {
  set -u
  systemctl stop 'npreal2.service' # pre_upgrade
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

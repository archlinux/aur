_tp_config="/etc/nslink.conf"
_tp_configps="${_tp_config}.pacsave"
_tp_config_orig="/usr/share/nslink/nslink.conf.orig"

post_upgrade() {
  set -u
  mandb -q
  systemctl daemon-reload
  # Handle the module update if DKMS doesn't
  if [ ! -d /usr/src/nslink-*/ ]; then
    depmod -a
    if systemctl -q is-enabled 'nslink.service'; then
      systemctl start 'nslink.service'
    fi
  fi
  set +u
}

post_install() {
  set -u
  if [ -f "${_tp_config}" ] && [ -f "${_tp_configps}" ] && diff -q "${_tp_config}" "${_tp_config_orig}"; then
    mv "${_tp_configps}" "${_tp_config}"
  fi
  set +u
  post_upgrade
  if systemctl -q is-enabled 'nslink.service' && ! systemctl -q is-active 'nslink.service'; then
    # We can't auto start the service because DKMS hasn't made the module yet
    echo 'Please start the service with'
    echo "  systemctl start 'nslink.service'"
  fi
}

pre_upgrade() {
  set -u
  if [ ! -d /usr/src/nslink-*/ ]; then
    systemctl stop 'nslink.service' # also rmmod the module
  fi
  set +u
}

pre_remove() {
  set -u
  systemctl stop 'nslink.service' # pre_upgrade
  set +u
}

post_remove() {
  set -u
  mandb -q
  systemctl daemon-reload
  set +u
}

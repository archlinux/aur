post_upgrade() {
  set -u
  systemctl daemon-reload
  # Handle the module update if DKMS doesn't
  if [ ! -d /usr/src/trueport-*/ ]; then
    depmod -a
    if systemctl -q is-enabled 'trueport.service'; then
      systemctl start 'trueport.service'
    fi
  fi
  #echo 'Perle TruePort (ptyx) startup scripts updated or installed'
  set +u
}

post_install() {
  set -u
  local _tp_configps
  local _tp_config
  for _tp_configps in /etc/trueport/*.pacsave; do
    _tp_config="${_tp_configps%\.pacsave}"
    if [ ! -s "${_tp_config}" ]; then
      mv "${_tp_configps}" "${_tp_config}"
    fi
  done
  set +u
  post_upgrade
}

pre_upgrade() {
  set -u
  if [ ! -d /usr/src/trueport-*/ ]; then
    systemctl stop 'trueport.service' # also rmmod the module
    killall 'trueportd' # the service doesn't stop trueportd started manually
  fi
  set +u
}

pre_remove() {
  pre_upgrade
}

post_remove() {
  set -u
  systemctl daemon-reload
  #echo 'Perle TruePort (ptyx) startup scripts removed'
  set +u
}

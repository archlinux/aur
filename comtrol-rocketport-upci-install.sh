_pkgname='comtrol-rocketport-upci'
_modulename='rocketupci'
_origmodname='rocket'

post_upgrade() {
  set -u
  systemctl daemon-reload
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    depmod -a
    if ! lsmod | cut -d' ' -f1 | grep -q "^${_modulename}"'$'; then
      #echo 'Reboot or load now with:'
      #echo "  sudo modprobe '${_modulename}'"
      if [ "${_modulename}" != "${_origmodname}" ]; then
        rmmod "${_origmodname}" 2> /dev/null # blacklisted on boot
      fi
      modprobe "${_modulename}"
      rocketport-upci-firmware.sh -p
    fi
  fi
  set +u
}

post_install() {
  set -u
  post_upgrade
  systemctl enable 'rocketport-upci-firmware.service'
  set +u
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    rmmod "${_modulename}"
  fi
  systemctl disable 'rocketport-upci-firmware.service'
  set +u
}

post_remove() {
  systemctl daemon-reload
}

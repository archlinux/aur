_pkgname='comtrol-rocketport-express-infinity'
_modulename='rocketrp2'
_origmodname='rp2'

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
    fi
  fi
  set +u
}

post_install() {
  set -u
  post_upgrade
  set +u
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    rmmod "${_modulename}"
  fi
  set +u
}

post_remove() {
  systemctl daemon-reload
}

_pkgname='moxa-mxser-mxupcie'
_modulenames=('mxupcie')
_origmodname='8250_moxa'

post_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    depmod -a
    rmmod "${_origmodname}" 2> /dev/null # blacklisted on boot
    local _modulename
    for _modulename in "${_modulenames[@]}"; do
      if ! lsmod | cut -d' ' -f1 | grep -q "^${_modulename}"'$'; then
        #echo 'Reboot or load now with:'
        #echo "  sudo modprobe '${_modulename}'"
        modprobe "${_modulename}"
      fi
    done
  fi
  systemctl daemon-reload
  set +u
}

post_install() {
  set -u
  post_upgrade
  systemctl enable "${_pkgname}.service"
  systemctl start "${_pkgname}.service"
  set +u
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    local _modulename
    for _modulename in "${_modulenames[@]}"; do
      rmmod "${_modulename}"
    done
  fi
  systemctl disable "${_pkgname}.service"
  set +u
}

post_remove() {
  systemctl daemon-reload
}

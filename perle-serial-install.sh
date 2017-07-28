_pkgname='perle-serial'
#_modulenames=('perle-serial' 'pparport-pc')
_modulenames=('perle-serial')
#_modulenames=('pparport-pc')
_service='/usr/lib/systemd/system/perle-serial-settings.service'

post_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    depmod -a
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
  if [ -s "${_service}" ]; then
    systemctl enable 'perle-serial-settings.service'
    systemctl start 'perle-serial-settings.service'
  fi
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
  if [ -s "${_service}" ]; then
    systemctl disable 'perle-serial-settings.service'
  fi
  set +u
}

post_remove() {
  systemctl daemon-reload
}

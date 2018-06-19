_pkgname='digi-dgnc'
_modulename='dgnc_digi'

post_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a # now done by pacman hook
    if ! lsmod | cut -d' ' -f1 | grep -q "^${_modulename}"'$'; then
      #echo 'Reboot or load now with:'
      #echo "  sudo modprobe '${_modulename}'"
      modprobe "${_modulename}"
    fi
  fi
  set +u
}

post_install() {
  post_upgrade
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    rmmod "${_modulename}"
  fi
  set +u
}

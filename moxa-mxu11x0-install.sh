_pkgname='moxa-mxu11x0'
_modulename='mxu11x0'
_builtinmod='ti_usb_3410_5052'

post_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a # now done by pacman hook
    modprobe -r "${_builtinmod}"
    modprobe "${_modulename}"
  fi
  set +u
}

post_install() {
  post_upgrade
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    modprobe -r "${_modulename}"
    modprobe "${_builtinmod}"
  fi
  set +u
}

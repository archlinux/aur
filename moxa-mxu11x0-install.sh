_pkgname='moxa-mxu11x0'
_modulename='mxu11x0'
_builtinmod='ti_usb_3410_5052'

_ui() {
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a # now done by pacman hook
    modprobe -r "${_builtinmod}"
    modprobe "${_modulename}"
  elif [ "$1" = 'i' ]; then
    echo "You can switch to the new module immediately with"
    echo "  modprobe -r ${_builtinmod}"
    echo "  modprobe ${_builtinmod}"
    # echo "  modprobe ${_modulename}"
  fi
}

post_upgrade() {
  set -u
  _ui 'u'
  set +u
}

post_install() {
  _ui 'i'
}

pre_remove() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    modprobe -r "${_modulename}"
    modprobe "${_builtinmod}"
  fi
  set +u
}

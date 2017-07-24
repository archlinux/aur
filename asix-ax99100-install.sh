_pkgname='asix-ax99100'
_modulename='ax99100'

post_upgrade() {
  set -u
  systemctl daemon-reload
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    depmod -a
    if ! lsmod | cut -d' ' -f1 | grep -q "^${_modulename}"'$'; then
      #echo 'Reboot or load now with:'
      #echo "  sudo modprobe '${_modulename}'"
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

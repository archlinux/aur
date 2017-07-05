_pkgname='snx-kmp'

post_upgrade() {
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    depmod -a
    if ! lsmod | cut -d' ' -f1 | grep -q '^snx$'; then
      #echo 'Reboot or load now with:'
      #echo "  sudo modprobe 'snx'"
      modprobe 'snx'
    fi
  fi
}

post_install() {
  post_upgrade
}

pre_remove() {
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    rmmod 'snx'
  fi
}


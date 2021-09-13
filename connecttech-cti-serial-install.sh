_pkgname='connecttech-cti-serial'
_servicename='cti-serial-set485.service'
_etcconf='/etc/cti-serial-set485.sh'

post_upgrade() {
  set -u
  # mandb -q
  systemctl daemon-reload
  # Handle the module update if DKMS doesn't
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    # depmod -a # now done by a pacman hook
    if systemctl -q is-enabled "${_servicename}"; then
      systemctl start "${_servicename}"
    fi
  fi
  set +u
}

post_install() {
  post_upgrade
  set -u
  if systemctl -q is-enabled "${_servicename}" && ! systemctl -q is-active "${_servicename}"; then
    # We can't auto start the service because DKMS hasn't made the module yet
    echo "If you have RS-485 jumperless settings add them to ${_etcconf} and start the service with"
    echo "  systemctl start ${_servicename}"
  fi
  set +u
}

pre_upgrade() {
  set -u
  if [ ! -d "/usr/src/${_pkgname}"-*/ ]; then
    systemctl stop "${_servicename}" # also rmmod the module
  fi
  set +u
}

pre_remove() {
  set -u
  systemctl stop "${_servicename}" # pre_upgrade
  set +u
}

post_remove() {
  set -u
  systemctl daemon-reload
  set +u
}

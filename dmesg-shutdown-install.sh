_pkgname='dmesg-shutdown'

post_upgrade() {
  set -u
  systemctl daemon-reload
  if ! systemctl -q is-enabled "${_pkgname}.service"; then
    systemctl enable --now "${_pkgname}.service"
  fi
  set +u
}

post_install() {
  post_upgrade
}

pre_remove() {
  systemctl disable --now "${_pkgname}.service"
}

post_remove() {
  systemctl daemon-reload
}

_servicename='brainboxes-serial-pci.service'

post_install() {
  set -u
  systemctl daemon-reload
  systemctl enable "${_servicename}"
  systemctl start "${_servicename}"
  echo 'To install your card'
  echo '  sudo bbportinst; sudo bash -x /etc/bbportinst.local'
  set +u
}

post_upgrade() {
  systemctl daemon-reload
}

pre_remove() {
  set -u
  systemctl stop "${_servicename}"
  systemctl disable "${_servicename}"
  set +u
}

post_remove() {
  systemctl daemon-reload
  rm -f '/etc/bbportinst.local'{~,.pacsave} '/etc/modprobe.d/parport_bb.conf'{~,.pacsave}
}

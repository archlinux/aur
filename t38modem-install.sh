_g_uid='uucp'
_g_gid='uucp'

post_upgrade() {
  set -u
  #chown -R "root:${_g_gid}" '/var/log/t38modem/'
  chown -R "${_g_uid}:root" '/var/log/t38modem/'
  set +u
}

post_install() {
  post_upgrade
}

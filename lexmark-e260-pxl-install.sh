_script='/usr/share/lexmark-e260-pxl/lexmark-e260-pxl.sh'

post_install() {
  set -u
  /usr/bin/bash "${_script}"
  set +u
}

pre_remove() {
  set -u
  echo 'Removing Lexmark patch'
  /usr/bin/bash "${_script}" -R
  set +u
}

pre_upgrade() {
  pre_remove
}

post_upgrade() {
  post_install
}

_daemons=('daemon' 'ditty')

pre_install() {
  set -u
  # Ensure that config files don't get lost on reinstall, chiefly from the Digi make install to package upgrade
  # post_install code will rename it back
  if [ -s '/etc/dgrp.backing.store' ] && [ ! -s '/etc/dgrp.backing.store.pacsave' ]; then
    mv '/etc/dgrp.backing.store' '/etc/dgrp.backing.store.pacsave'
  fi
  set +u
}

post_upgrade() {
  set -u
  #mandb -q
  # rmdir '/tmp/dgrp' # postinstall forgets to remove this. Useful on /tmp folders that are not mounted tmpfs
  systemctl daemon-reload
  #udevadm control --reload # Seems to work without this
  # Digi's postinstall automatically loads the daemons so we might as well too
  if [ ! -d /usr/src/dgrp-*/ ]; then # detect DKMS
    /usr/bin/dgrp/config/postinstall # this used to run depmod -a
    depmod -a
    local _daemon
    for _daemon in "${_daemons[@]}"; do
      systemctl enable "dgrp_${_daemon}.service"
      systemctl start "dgrp_${_daemon}.service"
    done
    #echo "RealPort (dgrp) startup scripts updated or installed"
  fi
  set +u
}

post_install() {
  post_upgrade
}

pre_upgrade() {
  set -u
  if [ ! -d /usr/src/dgrp-*/ ]; then
    local _daemon
    for _daemon in "${_daemons[@]}"; do
      systemctl stop "dgrp_${_daemon}.service"
      systemctl disable "dgrp_${_daemon}.service"
    done
    /usr/bin/dgrp/config/preuninstall
  fi
  set +u
}

pre_remove() {
  pre_upgrade
  set -u
  . '/usr/bin/dgrp/config/file_locations'
  if [ -f "${DGRP_STORE}.old" ]; then
    echo "To clean fully you may want to remove your config backup: ${DGRP_STORE}.old"
  fi
  if [ -f "${DGRP_STORE}.pacsave" ]; then
    echo "To clean fully you may want to remove your config backup: ${DGRP_STORE}.pacsave"
  fi
  set +u
}

post_remove() {
  set -u
  #mandb -q
  systemctl daemon-reload
  #udevadm control --reload # Seems to work without this
  #echo "RealPort (dgrp) startup scripts removed"
  set +u
}

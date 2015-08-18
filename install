#!/bin/bash

update_databases() {
  # Update mime database
  type -P update-mime-database &>/dev/null &&
    update-mime-database /usr/share/mime &>/dev/null

  # Update xdg icon database
  type -P xdg-icon-resource &>/dev/null &&
    xdg-icon-resource forceupdate --theme hicolor &>/dev/null

  # Update desktop database
  type -P update-desktop-database &>/dev/null &&
    update-desktop-database -q &>/dev/null
}

# arg 1:  the new package version
post_install() {
  # Add vboxusers group, GID 108 is reserved (http://wiki.archlinux.org/index.php/UID_and_GID_list),
  getent group vboxusers &> /dev/null || groupadd -f -g 108 vboxusers

  # Load new udev rule for module vboxdrv
  udevadm control --reload-rules

  # Update databases
  update_databases

  # Show warnings
  cat <<EOF

==> Remember to add allowed users to the vboxusers group:
==> # gpasswd -a USERNAME vboxusers
==
==> To compile/load virtualbox modules automatically at startup you can add dkms in your DAEMONS
==
==> To build and install your modules run dkms autoinstall
EOF
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
  # should be $2... pacman is bugged FS#29371.
  pre_remove "$2"

  # Remove any stuff remaining from the module compilation
  rm -Rf "/opt/VirtualBox"
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  post_install "$1"
  (($(vercmp $2 '4.1.14-2') < 0 )) && cat <<EOF || true

==> **Warning**
==> This version drop vboxdrv initscript.
==> Please change to dkms instead of vboxdrv in DAEMONS in rc.conf.
==>
EOF
}

# arg 1:  the old package version
pre_remove() {
  # Stop running services
  #[[ -x /etc/rc.d/vboxweb ]] && /etc/rc.d/vboxweb stop >/dev/null

  # Remove modules
  [[ -n $1 ]] && dkms remove vboxhost/${1%-*} --all >/dev/null || true
}

# arg 1:  the old package version
post_remove() {
  # Remove any stuff remaining from the module compilation
  rm -Rf "/opt/VirtualBox"

  # Remove any run files
  rm -Rf "/var/run/VirtualBox"

  # Update databases
  update_databases

  # remove vboxusers group
  groupdel vboxusers &>/dev/null || true
}

# vim:set ts=2 sw=2 ft=sh et:

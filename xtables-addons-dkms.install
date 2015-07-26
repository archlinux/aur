#!/bin/sh

# arg 1:  the new package version
post_install() {
  dkms add xtables-addons/$1
  cat << EOF
==> To build and install your modules run:
    dkms install xtables-addons/$1
==> To do this automatically at startup run:
    systemctl enable dkms.service
==> To install modules for all kernels execute shell script:
    for f in /lib/modules/[0-9]*; do dkms install xtables-addons/$1 -k \$(basename \$f); done
EOF
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
  local curver=$2
  # $2 is unset due to a bug. Query current version using pacman as fallback
  [ -n "$curver" ] || curver=$(pacman -Qi xtables-addons-dkms | awk '/^Version/{print $3}')
  pre_remove $curver
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  post_install "$1"
}

# arg 1:  the old package version
pre_remove() {
  # Remove modules using dkms
  [ -n "$1" ] && dkms remove xtables-addons/$1 --all >/dev/null || true
}

# vim:set ts=2 sw=2 ft=sh et:

#!/bin/sh

# arg 1:  the new package version
post_install() {
  _version=`echo ${1%%-*} | sed -rne 's,^([0-9]*:)?(.*),\2,p'`
  dkms install -m open-vm-tools/${_version}
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
  pre_remove "$2"
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  post_install "$1"
}

# arg 1:  the old package version
pre_remove() {
  # Remove modules using dkms
  _version=`echo ${1%%-*} | sed -rne 's,^([0-9]*:)?(.*),\2,p'`
  dkms remove -m open-vm-tools -v ${_version} --all
}

# vim:set ts=2 sw=2 ft=sh et:

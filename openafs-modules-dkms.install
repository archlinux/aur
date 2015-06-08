#!/bin/sh

post_install() {
  dkms add openafs/${1%-*}
  dkms install openafs/${1%-*}
}

pre_upgrade() {
  pre_remove "$2"
}

post_upgrade() {
  post_install "$1"
}

pre_remove() {
  [ -n "${1%-*}" ] && dkms remove openafs/${1%-*} --all
}

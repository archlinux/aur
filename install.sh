#!/bin/bash
# vim: set ft=sh ts=2 sw=2 et:

build() {
  add_binary dd
  add_binary mkpasswd
  add_runscript

  local mod

  map add_module 'dm-crypt' 'dm-integrity' 'hid-generic?'
  if [ -n "$CRYPTO_MODULES" ]; then
    for mod in $CRYPTO_MODULES; do
      add_module "$mod"
    done
  else
    add_all_modules '/crypto/'
  fi

  add_binary 'cryptsetup'

  map add_udev_rule \
    '10-dm.rules' \
    '13-dm-disk.rules' \
    '95-dm-notify.rules' \
    '/usr/lib/initcpio/udev/11-dm-initramfs.rules'

  # cryptsetup calls pthread_create(), which dlopen()s libgcc_s.so.1
  add_binary '/usr/lib/libgcc_s.so.1'

  # cryptsetup loads the legacy provider which is required for whirlpool
  add_binary '/usr/lib/ossl-modules/legacy.so'

  add_runscript
}

help() {
  cat <<EOF
Smart decryption mkinitcpio hook with Nuke password and decryption from file.
1. Tries to get password from the file or block device
2. If no password - asks interactively
3. If nuke password is entered - destroys luks headers
Check man dm-nuke.
EOF
}

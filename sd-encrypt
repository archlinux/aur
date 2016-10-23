#!/bin/bash

build() {
    local mod

    add_module dm-crypt
    if [[ $CRYPTO_MODULES ]]; then
        for mod in $CRYPTO_MODULES; do
            add_module "$mod"
        done
    else
        add_all_modules '/crypto/'
    fi

    add_binary "dmsetup"
    add_file "/usr/lib/udev/rules.d/10-dm.rules"
    add_file "/usr/lib/udev/rules.d/13-dm-disk.rules"
    add_file "/usr/lib/udev/rules.d/95-dm-notify.rules"
    add_file "/usr/lib/initcpio/udev/11-dm-initramfs.rules" "/usr/lib/udev/rules.d/11-dm-initramfs.rules"

    add_systemd_unit cryptsetup.target
    add_binary /usr/lib/systemd/system-generators/systemd-cryptsetup-generator
    add_binary /usr/lib/systemd/systemd-cryptsetup

    add_systemd_unit systemd-ask-password-console.path
    add_systemd_unit systemd-ask-password-console.service

    [[ -f /etc/crypttab.initramfs ]] && add_file /etc/crypttab.initramfs /etc/crypttab
}

help() {
    cat <<HELPEOF
This hook allows for an encrypted root device with systemd initramfs.

See the manpage of systemd-cryptsetup-generator(8) for available kernel
command line options. Alternatively, if the file /etc/crypttab.initramfs
exists, it will be added to the initramfs as /etc/crypttab. See the
crypttab(5) manpage for more information on crypttab syntax.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:

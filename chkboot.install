#!/bin/bash

post_install() {
    cat<<INSTALLEOF
    This package replaces the old chkboot package and the chkboot-git package.
    Check your configuration files and make all the adjustments necessary.
INSTALLEOF
}

post_remove() {
    cat<<REMOVEEOF
    Remove the "chkboot" from the "HOOKS" section in "/etc/mkinitcpio.conf"
    and rebuild the initramfs.
REMOVEEOF
}

post_upgrade() {
    post_install
}

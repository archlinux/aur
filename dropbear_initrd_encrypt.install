#!/bin/bash

post_install() {
    mkdir -p /etc/dropbear
    touch /etc/dropbear/root_key
    chmod 600 /etc/dropbear/root_key

    cat<<INSTALLEOF
    Insert your SSH public key into "/etc/dropbear/root_key", e.g. using
    "cat ~/.ssh/id_rsa.pub > /etc/dropbear/root_key". Add the "ip=" kernel 
    command parameter to your bootloader configuration with the appropriate 
    arguments (see https://wiki.archlinux.org/index.php/Mkinitcpio#Using_net). 
    
    Afterwards add the "dropbear encryptssh" hooks before "filesystems" within 
    the "HOOKS" array in "/etc/mkinitcpio.conf". Finally rebuild the initramsfs
    ("mkinitcpio -p linux").
INSTALLEOF
}

post_remove() {
    cat<<REMOVEEOF
    Remove both "dropbear" and "encryptssh" from "HOOKS" in 
    "/etc/mkinitcpio.conf", then rebuild the initramfs ("mkinitcpio -p linux").
REMOVEEOF
}

post_upgrade() {
    post_install
}


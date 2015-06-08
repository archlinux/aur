#!/bin/bash

post_install() {
    cat<<INSTALLEOF
    This hook install and run the inadyn-mt ddns updater, to dinamically update
    a dns name with the supported dynamic dns providers. It assume that the
    configuration is in "/etc/inadyn-mt.conf". You should use the background option
    to make inadyn-mt become a daemon. Also, you will can inform a dns server  that
    will be used by the inadyn-mt daemon to be able to resolve names. If you do not
    provide one, the public google nameservers will be used instead. To use it, put
    on your bootloader configuration a kernel paramter called nameserver which 
    contain the ip address of the nameserver you wish to use. After that, you just 
    need to put the ddns hook in the "/etc/mkinitcpio.conf" file and rebuild the 
    initramfs.
INSTALLEOF
}

post_remove() {
    cat<<REMOVEEOF
    Remove the "ddns" from the "HOOKS" section in "/etc/mkinitcpio.conf", then 
    rebuild the initramfs with ("mkinitcpio -p linux"). Also, if you configured
    your bootloader to use the nameserver kernel parameter, you can remove it.
REMOVEEOF
}

post_upgrade() {
    post_install
}

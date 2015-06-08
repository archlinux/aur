#!/bin/bash

post_install() {
    cat<<INSTALLEOF
    First, create a provider file in the /etc/ppp/peers directory and
    configure your user/secret into /etc/ppp/pap-secrets or /etc/ppp/chap-secrets,
    depending on your provider configuration. It's advised to test if the connection
    works before adding the hooks and rebuilding your initramfs.
    
    Afterwards add to your bootloader configuration two kernel parameters called
    ppp_provider and ppp_device in which the ppp_provider value is the filename of
    the provider you created, without the full path. As an example, if your 
    configuration file is /etc/ppp/peers/provider, use ppp_provider=provider.
    The ppp_device is the physical device used for the ppp connection (in case of 
    PPPoE), such as eth0 or eth1. This parameter is optional, in case your ppp 
    connection is done using a modem. If this is the case, you will need to add your
    modem's kernel module to the "MODULES" section in /etc/mkinitcpio.conf. This 
    hook is suited for remote unlocking of an encrypted root partition, using the 
    dropbear_initrd_encrypt hooks. Add the "ppp" hook to the "HOOKS" section in
    "/etc/mkinitcpio.conf" and rebuild the initramfs with ("mkinitcpio -p linux").
INSTALLEOF
}

post_remove() {
    cat<<REMOVEEOF
    Remove the "ppp" from the "HOOKS" section in "/etc/mkinitcpio.conf", then 
    rebuild the initramfs with ("mkinitcpio -p linux"). Optionally, also remove
    any provider you might have set in /etc/ppp/peers and any secrets. Or any
    modem module you possibly used in the "MODULES" section.
REMOVEEOF
}

post_upgrade() {
    post_install
}

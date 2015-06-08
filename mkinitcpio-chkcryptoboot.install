#!/bin/bash

post_install() {
    cat<<INSTALLEOF
    This hook create a hash of your bootloader code and check it on boot to warn
    you before you type your root container password. It is meant to be used in
    conjunction with GRUB cryptodisk feature. Also, for it being effective, your
    boot partition must be outside your root container. And with a different
    password than it. Configure /etc/default/chkcryptoboot.conf with your values
    add the "chkcryptoboot" just before the "encrypt" hook in the mkinitcpio conf
    "/etc/mkinitcpio.conf" and then rebuild your initramfs. Also, you should 
    rebuild your initramfs every time you run grub-install. Even if you run it 
    with the same parameters the code might change. Also, this hook introduces a 
    kernel cmdline parameter, that will try to detect if your boot partition was 
    bypassed. I suggest you use 2 hashes for this paremeter, one as the name and 
    other as the value. Running something like:
    "dd if=/dev/random bs=1024 count=1024 iflag=fullblock | sha256sum", should
    give your very good values. These should be added both to chkcryptoboot's and
    your bootloader's configuration.
INSTALLEOF
}

post_remove() {
    cat<<REMOVEEOF
    Remove the "chkcryptoboot" from the "HOOKS" section in "/etc/mkinitcpio.conf"
    and rebuild the initramfs. Also, remove the cmdline parameter and regenerate
    your bootloader configuration.
REMOVEEOF
}

post_upgrade() {
    post_install
}

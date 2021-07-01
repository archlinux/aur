# initramfs-l14kbdlight

This is a initcpio hook that can be used to turn the Librem 14's keyboard
backlight on during boot. This is usefull when prompted to type the LUKS
passphrase, for instance.

## Install

Build:

    makepkg .
    sudo pacman -U ./initramfs-l14kbdlight-*.pkg.tar.zst

Edit /etc/mkinitcpio.conf:

    HOOKS=(base udev autodetect modconf block keyboard l14kbdlight encrypt filesystems resume)

Regenerate initramfs:

    sudo mkinitcpio -p linux

Reboot.

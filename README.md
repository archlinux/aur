# bootsplash-systemd

Copy the files to `/usr/lib/systemd/system/` and run:

    systemctl enable bootsplash-ask-password-console.path
    systemctl enable bootsplash-ask-password-console.service
    systemctl enable bootsplash-hide-when-booted.service
    systemctl enable bootsplash-show-on-shutdown.service
    systemctl mask systemd-ask-password-console.path

Edit the `/etc/mkinitcpio.conf`, find the `HOOKS=` line and add: `bootsplash-XXXX` (XXXX is the name of the theme you have chosen)

Remove the quiet boot parameter and add `bootsplash.bootfile=bootsplash-themes/XXXX/bootsplash` (XXXX is the name of the theme you have chosen). For GRUB users, this can be done by editing the `GRUB_CMDLINE_LINUX_DEFAULT=` line in `/etc/default/grub`

Regenerate the initramfs : `sudo mkinitcpio -p linux`

`bootsplash-hide-when-booted.service` is  only needed for text mode use, as otherwise the splash won't go away when the console is ready. If you only ever boot to X, then you can leave it out.
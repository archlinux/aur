# arch-efistub
Small utility to automatically generate a bootable efistub linux kernel with
the cmdline and ramdisks embedded in a single file. Will rebuild the kernel
stub when:
 - Packages named `linux*` change
 - Packages named `*-dkms` change
 - Packages named `*-ucode` change
 - `mkinitcpio` is changed
 - `mkinitcpio-firmware` is changed
 - `/usr/lib/modules/*/vmlinuz` changes
 - `/usr/lib/initcpio/*` changes

## License
This project is licensed under the [M.I.T. License](https://github.com/Matthewacon/arch-efistub/blob/master/LICENSE).

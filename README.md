# Cryptobox #

A wrapper script for **cryptsetup** that makes it easy to create, mount and unmount encrypted image files using LUKS.

## Requirements ##

* **cryptsetup**: Userspace setup tool for transparent encryption of block devices using.
* **util-linux**: Miscellaneous system utilities for Linux, required for **losetup** and **mkfs**.

## Usage ##

* cryptobox: displays the list of commands
* cryptobox c filename.img filesystem size-in-mb: creates an image file with a given filesystem and size in megabytes. (eg: `cryptobox c myimg.img ext4 128`)
* cryptobox m filename.img /mount/point: mounts a given image file on a given directory. (eg: `cryptobox m myimg.img /mnt/cryptoimg`)
* cryptobox u /mount/point: unmounts an image file from a given directory. (eg: `cryptobox u /mnt/cryptoimg`)

## Credits ##

Written by Kevin MacMartin: [GitHub Projects](https://github.com/prurigro?tab=repositories) | [Arch Linux AUR Packages](https://aur.archlinux.org/packages/?SeB=m&K=prurigro)

## License ##

This script is open source and licensed under the [GPLv3](http://www.gnu.org/copyleft/gpl.html).

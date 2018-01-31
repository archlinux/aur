# draft-bin-AUR

This PKGBUILD for arch linux package system.
available at [https://aur.archlinux.org/packages/draft-bin/](https://aur.archlinux.org/packages/draft-bin/)

## Usage

To build:

    $ makepkg

To install:

    $ sudo pacman -U <package name>

To generate a new version, change the VERSION variable in the Makefile and run:

    $ make pkgbuild

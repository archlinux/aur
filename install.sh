#!/bin/bash

# This file is part of https://aur.archlinux.org/packages/initrd-dropbear/

# https://www.archlinux.org/pacman/PKGBUILD.5.html#_install_upgrade_remove_scripting

## arg 1:  the new package version
pre_install() {
    true
}

## arg 1:  the new package version
post_install() {
    true
}

## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
    true
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
    true
}

## arg 1:  the old package version
pre_remove() {
    true
}

## arg 1:  the old package version
post_remove() {
    true
}

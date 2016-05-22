#!/bin/bash

# https://www.archlinux.org/pacman/PKGBUILD.5.html#_install_upgrade_remove_scripting

## arg 1:  the new package version
pre_install() {
    true
}

## arg 1:  the new package version
post_install() {
    
    echo "Run post_install"

    local pkgname=initrd-dropbear

    local tag="/etc/initrd-release"

    local source="/usr/share/mkinitcpio/$pkgname"
    local target="/etc/systemd/system"
    local unit_list=$(grep -ql "$tag" $target/*.service)
    if [[ $unit_list ]] ; then
        echo "Keep existing $tag units in $target"
    else
        echo "Provision default $tag units for $target"
        install -Dm644 "$source/initrd-dropbear.service" "$target/initrd-dropbear.service"
        install -Dm644 "$source/initrd-network.service"  "$target/initrd-network.service"
    fi
    
    local source="/usr/share/mkinitcpio/$pkgname"
    local target="/etc/systemd/network"
    local unit_list=$(grep -ql "$tag" $target/*.network)
    if [[ $unit_list ]] ; then
        echo "Keep existing $tag units in $target"
    else
        echo "Provision default $tag units for $target"
        install -Dm644 "$source/initrd-network.network"  "$target/initrd-network.network"
    fi
    
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

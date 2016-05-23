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
    local file
    local source="/usr/share/mkinitcpio/$pkgname"
    
    local target="/etc/systemd/system"
    local source_list=$(grep -l "$tag" $source/*.service)
    local target_list=$(grep -l "$tag" $target/*.service)
    if [[ $target_list ]] ; then
        echo "Keep existing $tag units in $target"
    else
        echo "Provision default $tag units for $target"
        for file in $source_list ; do
            install -b -D -m644 "$source/$file" "$target/$file"
        done
    fi
    
    local target="/etc/systemd/network"
    local source_list=$(grep -l "$tag" $source/*.network)
    local target_list=$(grep -l "$tag" $target/*.network)
    if [[ $target_list ]] ; then
        echo "Keep existing $tag units in $target"
    else
        echo "Provision default $tag units for $target"
        for file in $source_list ; do
            install -b -D -m644 "$source/$file" "$target/$file"
        done
    fi
    
}

## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
    post_install
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

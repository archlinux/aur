#!/bin/bash

# https://www.archlinux.org/pacman/PKGBUILD.5.html#_install_upgrade_remove_scripting

## arg 1:  the new package version
pre_install() {
    true
}

## arg 1:  the new package version
post_install() {
    resource_create
}

## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
    true
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
    resource_create
}

## arg 1:  the old package version
pre_remove() {
    true
}

## arg 1:  the old package version
post_remove() {
    resource_delete
}

########################

tag="/etc/initrd-release"
pkgname=initrd-dropbear

source="/usr/share/mkinitcpio/$pkgname"
source_list_net=$(grep -l "$tag" $source/*.network 2> /dev/null)
source_list_sys=$(grep -l "$tag" $source/*.service 2> /dev/null)

target="/etc/systemd"
target_net="$target/network"
target_sys="$target/system"
target_list_net=$(grep -l "$tag" $target_net/*.network 2> /dev/null)
target_list_sys=$(grep -l "$tag" $target_sys/*.service 2> /dev/null)

resource_create() {
    
    echo "Run resource_create"

    if [[ $target_list_net ]] ; then
        echo "Keep existing $tag units in $target_net"
    else
        echo "Provision default $tag units for $target_net"
        for file in $source_list_net ; do
            file=$(basename $file)
            install -b -D -m644 "$source/$file" "$target_net/$file"
        done
    fi
    
    if [[ $target_list_sys ]] ; then
        echo "Keep existing $tag units in $target_sys"
    else
        echo "Provision default $tag units for $target_sys"
        for file in $source_list_sys ; do
            file=$(basename $file)
            install -b -D -m644 "$source/$file" "$target_sys/$file"
        done
    fi
}

resource_delete() {
    
    echo "Run resource_delete"

    echo "Remove default $tag units from $target_net"
    for file in $source_list_net ; do
        file=$(basename $file)
        rm -v -f "$target_net/$file"
    done

    echo "Remove default $tag units from $target_sys"
    for file in $source_list_sys ; do
        file=$(basename $file)
        rm -v -f "$target_sys/$file"
    done
    
    echo "Remove $source"
    rm -v -r -f $source
    
}

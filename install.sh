#!/bin/bash

## arg 1:  the new package version
pre_install() {
    true
}

## arg 1:  the new package version
post_install() {

    local file="initrd-dropbear.service"
    local source="/usr/lib/systemd/system/$file"
    local target="/etc/systemd/system/$file"
    
    if [ -e $target ] ; then
        echo "Keep existing service $target"
    else
        echo "Provision default service $target"
        install -Dm644 $source $target
    fi

    local file="initrd-dropbear.network"
    local source="/usr/lib/systemd/network/$file"
    local target="/etc/systemd/network/$file"
    
    if [ -e $target ] ; then
        echo "Keep existing network $target"
    else
        echo "Provision default network $target"
        install -Dm644 $source $target
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

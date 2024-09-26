#!/bin/bash

set -euo pipefail
use_tmpfs=true
CHROOT="/tmp/mkarchroot"

check_available_ram() {
    if [ "$(awk '/^MemAvailable:/ { print $2; }' /proc/meminfo)" -lt 50000 ]; then
        use_tmpfs=false
    fi
}

create_chroot_directory() {
    if [ $use_tmpfs ]; then
        sudo mount --mkdir -t tmpfs -o defaults,size=20G tmpfs $CHROOT
    else
        sudo mkdir -p "$CHROOT"
    fi
}

create_chroot_environment() {
    if [[ ! -d "$CHROOT/root" ]]; then
        mkarchroot -M /etc/makepkg.conf "$CHROOT/root" base-devel
    fi
}

build_package(){
    arch-nspawn "$CHROOT/root" pacman -Syu
    makechrootpkg -c -r "$CHROOT" -- -Asf .
    makepkg --printsrcinfo >.SRCINFO
}

sign_package(){
    PACKAGE="$(makepkg --packagelist)"
    gpg --use-agent --output "$PACKAGE.sig" --detach-sign "$PACKAGE"
}

delete_chroot_environment() {
    if [ "$(stat -f --format=%T "$CHROOT")" == "btrfs" ]; then
        {
            sudo btrfs subvolume delete "$CHROOT/root/var/lib/portables"
            sudo btrfs subvolume delete "$CHROOT/root/var/lib/machines"
            sudo btrfs subvolume delete "$CHROOT/root"
        } >>/dev/null 2>&1
    elif [ "$(stat -f --format=%T "$CHROOT")" == "tmpfs" ]; then
        sudo umount -f $CHROOT
    fi
    sudo rm -Rf $CHROOT
}

check_available_ram
create_chroot_directory
create_chroot_environment
build_package
sign_package
delete_chroot_environment

shopt -s extglob
rm -Rf -- !(keys)/ *.log *.gz

# vim: set ts=4 sw=4 et:

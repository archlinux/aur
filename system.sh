#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
system_compile_and_install_without_root() {
    local __doc__='
    Compiles and installs a program by its given source code. Your have to
    be inside the source code folder to run this function.

    >>> system.compile_and_install_without_root /home/user/myUser/
    ...
    '
    local install_location="~/system/"
    if [ "$1" ]; then
        install_location="$1"
    fi
    chmod +x ./configure
    ./configure prefix="$install_location"
    # NOTE: Another possibility to install to a specified path is
    # "make install DESTDIR=$1"
    make install
    return $?
}
alias system.compile_and_install_without_root='system_compile_and_install_without_root'
system_mount_root_file_system_writable() {
    local __doc__='
    If root file system is mounted as read only this command makes it
    runnable.

    >>> system.mount_root_file_system_writable
    '
    mount -rw --options remount /
    return $?
}
alias system.mount_root_file_system_writable='system_mount_root_file_system_writable'
system_restore_grub() {
    local __doc__='
    Restores the linux boot-manager grub if it was overwritten (e.g. in
    windows).

    >>> system.restore_grub
    '
    # TODO use arch chroot
    echo 'Mount systems root filesystem'
    mount /dev/disk/by-label/system /mnt
    echo 'Bind Kernel directories to run kernel in "/mnt"'
    mount --bind /dev /mnt/dev
    mount --bind /proc /mnt/proc
    mount --bind /run /mnt/run
    mount --bind /sys /mnt/sys
    mount --bind /tmp /mnt/tmp
    echo "Change root file system from rescue root system to system's root filesystem (/mnt)"
    chroot /mnt grub-install /dev/sda
    return $?
}
alias system.restore_grub='system_restore_grub'
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

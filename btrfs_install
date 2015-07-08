#!/bin/bash

build() {
    add_module btrfs

    add_binary btrfs
    add_binary btrfsck
    add_binary kexec

    if [ -f /etc/default/btrfs_advanced ]; then
        add_file /etc/default/btrfs_advanced
    fi

    add_runscript
}


help() {
    cat <<HELPEOF
This hook provides advanced support for single and multi device btrfs
partitions, including rollback operations at boot time. If you do not
use the "udev" hook, then you MUST add the "btrfs" hook before this one.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:

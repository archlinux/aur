#!/bin/bash

build() {
    add_binary date
    add_binary growpart
    add_binary resize2fs
    add_binary sfdisk
    add_runscript
}

help() {
    cat <<HELPEOF
This hook expands the root filesystem to the size of the partition
which is mostly useful for cloud images to expand to the block device
they've been given.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:

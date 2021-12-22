#!/bin/bash

set -e

post_install() {
    if ! getent group cvdnetwork > /dev/null 2>&1
    then
        groupadd --system cvdnetwork
    fi

    # Create the kvm group when running inside a docker container.
    if test -f /.dockerenv && ( ! getent group kvm > /dev/null 2>&1 )
    then
        groupadd --system kvm
    fi

    sudo systemctl enable --now cuttlefish-common
}

# vim: ft=sh:ts=4:sw=4:et:nowrap

#!/bin/bash

set -e

post_install() {
    if ! getent passwd _cutf-operator > /dev/null 2>&1
    then
        # The cvdnetwork group is created by cuttlefish-base
        useradd --system --shell /usr/bin/nologin --home-dir /var/empty \
                --no-create-home --badnames --gid cvdnetwork _cutf-operator
    fi

    sudo systemctl daemon-reload
    sudo systemctl enable --now cuttlefish-operator
}

# vim: ft=sh:ts=4:sw=4:et:nowrap

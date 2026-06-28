#!/usr/bin/env bash

exec bwrap \
    --die-with-parent --new-session --unshare-pid --unshare-ipc --unshare-uts \
    --proc /proc \
    --dev /dev \
    --dev-bind /dev/net/tun /dev/net/tun \
    --ro-bind /usr/share /usr/share \
    --ro-bind /usr/lib /usr/lib \
    --ro-bind /usr/lib64 /usr/lib64 \
    --ro-bind /usr/bin /usr/bin \
    --symlink /usr/lib /lib \
    --symlink /usr/lib64 /lib64 \
    --symlink /usr/bin /bin \
    --symlink /usr/bin /sbin \
    --ro-bind /etc /etc \
    --ro-bind /sys /sys \
    --tmpfs /run \
    --tmpfs /tmp \
    --symlink /run /var/run \
    --symlink /tmp /var/tmp \
    --bind /var/lib/uu /var/lib/uu \
    --chdir /var/lib/uu \
    /usr/lib/uudeck/uuplugin /var/lib/uu/uu.conf

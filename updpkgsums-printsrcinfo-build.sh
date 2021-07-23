#!/usr/bin/env bash
docker run --rm -v "$PWD:/build" archlinux:base bash -c "
    pacman -Syu --noconfirm base-devel pacman-contrib;
    useradd -u $UID -m build;
    echo 'build      ALL = NOPASSWD: ALL' >> /etc/sudoers;
    su build -c '
        cd /build && \
        updpkgsums && \
        makepkg --printsrcinfo > .SRCINFO && \
        makepkg --noconfirm -si && /usr/bin/snage --version'"

#!/usr/bin/env bash

docker run \
    --rm \
    --platform linux/amd64 \
    -v $(pwd):/srv \
    --entrypoint /usr/bin/bash \
    --workdir /srv \
    docker.io/archlinux -c '\
        pacman -Sy --noconfirm archlinux-keyring && \
        pacman -Syu --noconfirm pacman-contrib pacman git sudo binutils && \
        git config --global --add safe.directory /srv && \
        git clean -fdx && \
        chmod a+w PKGBUILD .SRCINFO . && \
        sudo -u nobody updpkgsums && \
        sudo -u nobody makepkg --printsrcinfo > .SRCINFO && \
        sudo -u nobody makepkg \
        chmod a-w PKGBUILD .SRCINFO . \
    '

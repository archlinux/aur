#!/usr/bin/env bash

docker run \
    --rm \
    -v $(pwd):/srv \
    --platform linux/amd64 \
    --entrypoint /usr/bin/bash \
    --workdir /srv \
    docker.io/archlinux -c '\
        pacman -Sy --noconfirm archlinux-keyring && \
        pacman -Syu --noconfirm pacman-contrib pacman git sudo binutils go gcc && \
        git clean -fdx && \
        chmod a+w PKGBUILD .SRCINFO . && \
        sudo -u nobody updpkgsums && \
        sudo -u nobody makepkg --printsrcinfo > .SRCINFO && \
        GOPATH=/srv/go GOCACHE=/srv/cache sudo -E -u nobody makepkg \
        chmod a-w PKGBUILD .SRCINFO . \
    '

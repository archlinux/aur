#!/usr/bin/bash

exec docker run \
    --user 1000 \
    --rm --volume "$(pwd):/workdir:ro" \
    --env BUILDDIR=/tmp \
    --env PKGDEST=/tmp \
    --env SRCDEST=/tmp \
    --workdir /workdir \
    archlinux:base-devel makepkg --printsrcinfo > .SRCINFO


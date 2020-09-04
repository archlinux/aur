#!/bin/bash

UPSTREAM="/data/programming/archlinux/packages/linux/repos/core-x86_64"

git -C "$UPSTREAM" pull
cp "$UPSTREAM/config" config
git diff --no-index "$UPSTREAM/PKGBUILD" PKGBUILD

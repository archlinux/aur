#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm ${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz

echo "## install complete"

echo "## check installed files"

mairu --help

echo "test OK"

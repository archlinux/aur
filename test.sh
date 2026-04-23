#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm tencentcloud-sdk-python-${sdk_pkgver}-${sdk_pkgrel}-any.pkg.tar.xz
pacman -U --noconfirm "${pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.xz"

echo "## install completed"

echo "## check installed files"

echo "## check version info"
tccli --version

echo "## check help"
tccli help

echo "test OK"

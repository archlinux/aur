#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm "${pkgname}-${pkgver}-${pkgrel}-$(uname -m).pkg.tar.xz"

echo "## install complete"

echo "## check installed files"

echo
echo "### check command help"

ecsta --help

echo
echo "### check command version"

ecsta version

echo "test OK"

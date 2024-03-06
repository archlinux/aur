#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm "${pkgname}-${pkgver}-${pkgrel}-$(uname -m).pkg.tar.xz"

echo "## install complete"

echo "## check installed files"

echo
echo "### check command help"

${execname} --help

echo
echo "### check command version"

${execname} version

echo "test OK"

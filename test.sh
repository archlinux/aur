#!/bin/bash

set -eu

source ./PKGBUILD

echo "## install start"
pacman -U --noconfirm "${pkgname}-${pkgver}-${pkgrel}-$(uname -m).pkg.tar.xz"

echo "## install completed"

echo "## check installed files"

echo
echo "### check command help"

${_execname} --help

echo
echo "### check command version"

${_execname} version

echo "test OK"

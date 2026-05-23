#!/bin/bash
# SPDX-FileCopyrightText: 2026 Mohan Raman <mohan43u@gmail.com>
# SPDX-License-Identifier: 0BSD

base=$(dirname $(realpath "${0}"))
pushd "${base}"
export PACKAGER="Mohan Raman <mohan43u@gmail.com>"
rm -fr zig-out &&
    makepkg -sfcC &&
    makepkg -s --printsrcinfo >.SRCINFO
popd

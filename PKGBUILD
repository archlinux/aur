#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=boostnode
pkgver=VERSION
pkgrel=14
pkgdesc='a high reliable python library'
arch=('any')
url='http://torben.website/boostNode'
license=('CC-BY-3.0')
depends=('python')
makedepends=('git' 'coreutils')
source=('git+https://github.com/thaibault/boostNode')
md5sums=('SKIP')

pkgver() {
    cd boostNode
    echo "1.0.r$(git rev-list --count HEAD)$(git rev-parse --short HEAD)"
}

package() {
    cp --recursive --force "${srcdir}/boostNode" "${pkgdir}/usr/lib/python3.5"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

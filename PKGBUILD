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
pkgver=1.0.16
pkgrel=38
pkgdesc='a high reliable python library'
arch=('any')
url="http://torben.website/${pkgname}"
license=('CC-BY-3.0')
depends=('python')
makedepends=('unzip')
source=("http://torben.website/${pkgname}/data/distributionBundle.zip")
md5sums=('SKIP')

package() {
    install --directory --mode 755 "${pkgdir}/usr/lib/python3.5/${pkgname}"
    unzip -o -d "${pkgdir}/usr/lib/python3.5/${pkgname}" \
        "distributionBundle.zip"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

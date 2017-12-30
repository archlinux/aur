#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=filelinker
pkgver=1.0.11
pkgrel=17
pkgdesc='keeps hard links in sync.'
arch=('any')
url="http://torben.website/${pkgname}"
license=('CC-BY-3.0')
depends=('python' 'boostnode')
provides=(filelinker)
source=("${pkgname}.py")
md5sums=('SKIP')
copyToAUR=true

package() {
    install -D --mode 755 "${srcdir}/${pkgname}.py" \
        "${pkgdir}/usr/bin/${pkgname}"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

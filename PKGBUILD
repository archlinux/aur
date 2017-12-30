#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=bash-link
pkgver=1.0.10
pkgrel=8
pkgdesc='a high reliable bash library'
arch=('any')
url='http://torben.website/bashLink'
license=('CC-BY-3.0')
depends=()
source=('bashLink.sh')
md5sums=('SKIP')
copyToAUR=true

package() {
    install -D --mode 755 "${srcdir}/bashLink.sh" "${pkgdir}/usr/bin/bashLink"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=file-linker
pkgver=1.0.2
pkgrel=7
pkgdesc='keeps hard links in sync.'
arch=('any')
url='http://torben.website/fileLinker'
license=('CC-BY-3.0')
depends=('python')
provides=(file-linker)
source=('fileLinker.py')
md5sums=('SKIP')

package() {
    install -D --mode 755 "${srcdir}/fileLinker.py" \
        "${pkgdir}/usr/bin/file-linker"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

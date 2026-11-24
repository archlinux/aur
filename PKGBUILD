#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]tsickert.com) 16.12.2012

# License
# -------

# This library written by Torben Sickert stands under a creative commons naming
# 4.0 international license.
# See https://creativecommons.org/licenses/by/4.0/deed.de
# endregion
pkgname=containerbase
pkgver=2.0.1
pkgrel=1
pkgdesc='docker base configuration'
arch=(any)
url=https://tsickert.com/containerbase
license=(CC-BY-4.0)
depends=(bash docker)
source=(systemd.service)
sha256sums=('6d1db4aae8c60132b7fe5e8adf0c92d03d48b94522b828286c56529012fbe908')
copy_to_aur=true

package() {
    install -D --mode 644 "${srcdir}/systemd.service" \
        "${pkgdir}/etc/systemd/system/containerbase.service"
}

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
pkgver=1.0.0
pkgrel=1
pkgdesc='docker base configuration'
arch=(any)
url=https://tsickert.com/containerbase
license=(CC-BY-4.0)
depends=(bash docker)
source=(systemd.service)
md5sums=(SKIP)
copy_to_aur=true

package() {
    install -D --mode 644 "${srcdir}/systemd.service" \
        "${pkgdir}/etc/systemd/system/containerbase.service"
}

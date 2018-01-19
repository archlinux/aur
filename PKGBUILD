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
pkgver=1.0.32
pkgrel=30
pkgdesc='a high reliable bash library'
arch=(any)
url='http://torben.website/bashlink'
license=('CC-BY-3.0')
depends=()
source=(arguments.sh array.sh changeroot.sh cli.sh cracking.sh dependency.sh dictionary.sh display.sh doctest.sh documentation.sh exception.sh filesystem.sh globals.sh logging.sh module.sh network.sh number.sh pacman.sh path.sh ssh.sh string.sh system.sh time.sh tools.sh)
md5sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)
copy_to_aur=true

package() {
    install -D --mode 755 "${srcdir}/"* "${pkgdir}/usr/bin/bashlink/"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

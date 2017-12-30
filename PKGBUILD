#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=reachable-watcher
pkgver=1.0.13
pkgrel=15
pkgdesc='Check status codes of web servers and sends notification e-mails'
arch=('any')
url='http://torben.website/reachableWatcher'
license=('CC-BY-3.0')
depends=('bash' 'curl' 'grep' 'coreutils')
optdepends=('msmtp: for automatic email notifications on missing sources')
provides=(reachable-watcher)
source=('reachableWatcher.sh' 'reachableWatcher.service')
md5sums=('SKIP' 'SKIP')
copyToAUR=true

package() {
    install -D --mode 755 "${srcdir}/reachableWatcher.sh" \
        "${pkgdir}/usr/bin/reachable-watcher"
    install -D --mode 755 "${srcdir}/reachableWatcher.service" \
        "${pkgdir}/etc/systemd/system/reachable-watcher.service"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion

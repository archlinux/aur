# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal
pkgver=1.0.16
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
source_x86_64=("snortal-x86_64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.16/snortal-linux-x86_64")
source_aarch64=("snortal-aarch64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.16/snortal-linux-aarch64")
source_armv7h=("snortal-armv7h-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.16/snortal-linux-armv7")
source_i686=("snortal-i686-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.16/snortal-linux-x86")
sha256sums_x86_64=('148ed9c9fa81f280a1ab421df7a0db44d32fe14cc9fc646fbcd971cefd3ff222')
sha256sums_aarch64=('bd9f5562c04062a421e8a61f660df8c83f17891b9ea241e9054c8ba82b24d8e2')
sha256sums_armv7h=('2908a1766fc0d94201426076a015ad15175f0039dd8dc1e43d4968f6c6fa9534')
sha256sums_i686=('67536c61fcff930773a45151c3d2f0564bda31cb79069885415958ba66067d1c')

package() {
    install -Dm0755 "snortal-${CARCH}-${pkgver}" "$pkgdir/usr/bin/snortal"
}

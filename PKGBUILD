# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal-bin
pkgver=1.0.7
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
provides=('snortal')
conflicts=('snortal')
source_x86_64=("snortal-x86_64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.7/snortal-linux-x86_64")
source_aarch64=("snortal-aarch64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.7/snortal-linux-aarch64")
source_armv7h=("snortal-armv7h-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.7/snortal-linux-armv7")
source_i686=("snortal-i686-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.7/snortal-linux-x86")
sha256sums_x86_64=('6b4391606f3a8ebcb25e9e7574f7a159e0b7518703bb68936b8541e31fc99b64')
sha256sums_aarch64=('00dd3463893b9d750a6e64753cb4e03ca86975da91995b97a4aef62ac5ba356a')
sha256sums_armv7h=('f4c90bc4c5965b2ff5bf04f2326d778c1bfe0a7715fbd472b5fb0531b5dfc093')
sha256sums_i686=('50a3b9710e050f6b008f20ebd8d62d21de2636f456c80b8c0bb09b02dbfba1d1')

package() {
    install -Dm0755 "snortal-${CARCH}-${pkgver}" "$pkgdir/usr/bin/snortal"
}

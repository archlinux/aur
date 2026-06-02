# Maintainer: George Oastler <goastler4 at gmail dot com>
# SPDX-License-Identifier: 0BSD
pkgname=snortal-bin
pkgver=1.0.8
pkgrel=1
pkgdesc='Detect captive portal URLs on a Linux network'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/goastler/snortal'
license=('AGPL-3.0-or-later')
provides=('snortal')
conflicts=('snortal')
source_x86_64=("snortal-x86_64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.8/snortal-linux-x86_64")
source_aarch64=("snortal-aarch64-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.8/snortal-linux-aarch64")
source_armv7h=("snortal-armv7h-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.8/snortal-linux-armv7")
source_i686=("snortal-i686-${pkgver}::https://github.com/goastler/snortal/releases/download/v1.0.8/snortal-linux-x86")
sha256sums_x86_64=('6d504dbb7827baa706c4e76fabc1e20b34058cadcfd3ba7391d60b9276427553')
sha256sums_aarch64=('71b41011468068a1d5891712720b49ec71de72e2c4b01c04c7b55e2bce10a801')
sha256sums_armv7h=('7e46d91b2db7c5961bfe7ed4cf486af8741d8bde1b830e95c4f519ad305cf061')
sha256sums_i686=('cb5455d33ad15e030235231fd2179ce02c08afc93bfdb612bb330500e65bf126')

package() {
    install -Dm0755 "snortal-${CARCH}-${pkgver}" "$pkgdir/usr/bin/snortal"
}

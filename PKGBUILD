# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=red-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Red is a next-generation programming language strongly inspired by Rebol"
arch=('i686' 'x86_64')
url="https://www.red-lang.org"
license=('custom:BSD-3-Clause' 'custom:BSL-1.0')
depends_x86_64=('lib32-curl')
provides=(red)
conflicts=(red)
options=(!strip)
source=("red-$pkgver::https://static.red-lang.org/dl/linux/red-064")
sha256sums=('ad08b85356e24c3bf77d624c005c6fd7a44bb6b1924118af3dcdb94e7d7b4531')

package() {
	install -Dm755 "red-$pkgver" "$pkgdir/usr/bin/red"
}

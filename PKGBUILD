# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=semicolons
pkgver=1.0
pkgrel=1
pkgdesc='Count number of semicolons in code'
url='https://codeberg.org/maandree/semicolons'
arch=(x86_64 aarch64)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(42bda3e62397094402ac7394f39bbd695dd6f31a3202e82d6d82f48c94c0b861)

build () {
	cd "$srcdir/semicolons"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/semicolons"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

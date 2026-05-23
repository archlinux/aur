# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=braces
pkgver=1.0
pkgrel=1
pkgdesc='Count number of braces in code'
url='https://codeberg.org/maandree/braces'
arch=(x86_64 aarch64)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(714333fe3718ac1c9af4a066eee76620f9aad192d22891ad0373330855c3d185)

build () {
	cd "$srcdir/braces"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/braces"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

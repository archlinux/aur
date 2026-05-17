# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=sumart
pkgver=1.0
pkgrel=1
pkgdesc='Visualise checksums'
url='https://codeberg.org/maandree/sumart'
arch=(x86_64 aarch64)
license=('custom:ISC')
depends=(libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(0ff474ed1b6bb5f31ec0869a45bba6ae9a3b98f186ecce81970f51dc4773fb4d)

build () {
	cd "$srcdir/sumart"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/sumart"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

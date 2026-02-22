# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=bfind
pkgver=3.0.2
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://codeberg.org/maandree/bfind"
arch=(any)
license=(custom:ISC)
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(45f3084febfc21fdca30c13617d8836a5e59bd271ecb2f4a4282af773f36b519)


build() {
	cd "$srcdir/bfind"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/bfind"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

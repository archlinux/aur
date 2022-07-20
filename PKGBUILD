# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=bfind
pkgver=3.0.1
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://codeberg.org/maandree/bfind"
arch=(any)
license=(custom:ISC)
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(56503678a91e0add62073981e89bf5c4de514a94e88b242c1cbabf3d011fc9dd)


build() {
	cd "$srcdir/bfind"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/bfind"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

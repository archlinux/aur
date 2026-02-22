# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=makeenv
pkgver=1.0.3
pkgrel=1
pkgdesc='Run make(1) with environment loaded from .makeenv'
url='https://codeberg.org/maandree/makeenv'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(64503f6d6827263a53edf730ebfbc57342c4905d7737bb775a8a3abbcc36a387)

build () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

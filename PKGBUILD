# Contributor: Sebastian Wolf <fatmike at melonkru dot de>
pkgname=rgzip
pkgver=0.991119
pkgrel=1
pkgdesc="A wrapper for gzip to make it more rsync friendly"
url="http://svana.org/~kleptog/rgzip.html"
arch=('i686' 'x86_64')
license=('public domain')
source=('http://svana.org/~kleptog/rgzip.c')
md5sums=('dc75d632c8b8e5d90e6bd24e8d416cb0')
install=rgzip.install

build() {
	gcc -Wall -O2 -o rgzip rgzip.c || return 1
}

package() {
	install -m755 -D rgzip $pkgdir/usr/bin/rgzip || return 1
}

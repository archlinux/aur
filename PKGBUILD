# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20200704
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguint"
license=('unknown')
depends=('postgresql')
source=("https://github.com/petere/pguint/archive/$pkgver.tar.gz")
md5sums=('a73a82525e36589c09f07718e12e8125')

build() {
	cd "pguint-$pkgver"
	make
}

package() {
	cd "pguint-$pkgver"
	make DESTDIR="$pkgdir/" install
}

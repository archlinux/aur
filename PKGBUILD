# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20150301
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguint"
license=('unknown')
depends=('postgresql')
source=("https://github.com/petere/pguint/archive/$pkgver.tar.gz")
md5sums=('b8bb7878c82bf251242f5afdc9a4b6ba')

build() {
	cd "pguint-$pkgver"
	make
}

package() {
	cd "pguint-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=postgresql-uint
pkgver=1.20160819
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguint"
license=('unknown')
depends=('postgresql')
source=("https://github.com/petere/pguint/archive/$pkgver.tar.gz")
md5sums=('c48ec190c69434c707e23f5250ad555c')

build() {
	cd "pguint-$pkgver"
	make
}

package() {
	cd "pguint-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=rrcc
pkgver=0.8.3
pkgrel=1
pkgdesc="RoboRock Control Center"
arch=('any')
url="https://github.com/LazyT/rrcc"
license=('GPL3')
makedepends=('git' 'make' 'gcc')
source=("$pkgname"::"git+https://github.com/LazyT/rrcc.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	qmake
	make
}

package() {
	cd "$pkgname"
	install -Dm755 ./rrcc "${pkgdir}/usr/bin/rrcc" 
}

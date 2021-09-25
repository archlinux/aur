# Maintainer: opale95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.62.2
pkgrel=1
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('17c8b8e68e0777cdef23963fbe3a1496433a44cc0f29c791395cd99e4b001ca7')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


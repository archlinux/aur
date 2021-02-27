# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.55.0
pkgrel=3
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('3572e990c547f30d3294bd924136cb047d4489c9dac66e98124409805ecd127b')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


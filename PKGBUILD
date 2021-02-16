# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.54.1
pkgrel=2
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('901ea678f1fe02e96860260aca5565fa75dae24016e5ade002660f635c3ff6f9')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


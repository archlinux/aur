# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.53.2
pkgrel=1
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('093d3d5c48419dc0dfe9975fe206ad6bafa42d5c35cdcb8e1e91efeb090d3bde')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


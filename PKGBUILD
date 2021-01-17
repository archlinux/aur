# Maintainer: stardust95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.53.0
pkgrel=1
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('8d9f29800876d8294ec625c8774d0c954e8516739a31dfd95f420793849c7a12')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


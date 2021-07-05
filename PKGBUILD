# Maintainer: opale95
# Contributor: Namarrgon
pkgname=lebiniou-data
pkgver=3.60.0
pkgrel=2
pkgdesc="Data files for lebiniou"
arch=('any')
url="https://biniou.net/"
license=('GPL')
source=("https://gitlab.com/lebiniou/lebiniou-data/-/archive/version-$pkgver/lebiniou-data-version-$pkgver.tar.gz")
sha256sums=('a3bb77b2194f1106646fda54564eb98acfb082ee3c7549f376e94785ba6c33c4')

build() {
	cd "$pkgname-version-$pkgver"

	./bootstrap
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-version-$pkgver"

	make DESTDIR="$pkgdir/" install
}


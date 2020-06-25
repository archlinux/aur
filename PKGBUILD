# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=refl-cpp
pkgver=0.11.0
pkgrel=2
epoch=
pkgdesc="A modern compile-time reflection library for C++ with support for overloads, templates, attributes and proxies"
arch=('any')
url="https://github.com/veselink1/refl-cpp"
license=('MIT')
groups=()
depends=()
makedepends=("dos2unix")
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b298f226d3733d3fe0c661d2662d600f061b74f7343a790f48ea225f3c03f946')

prepare() {
	cd "$pkgname-$pkgver"

	dos2unix refl.hpp
}

build() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 refl.hpp "$pkgdir/usr/include/refl.hpp"
}

# Maintainer: realroot <scorpion2185@protonmail.com>

pkgname=smlock
pkgver=0.7.5
pkgrel=2
pkgdesc="Smlock is a minimal screen locker, for Xorg, optimized for mobile."
url="https://codeberg.org/jackc/smlock"
arch=(x86_64 aarch64)
license=("MIT")
makedepends=("libx11" "imlib2" "make" "git")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/jackc/smlock/archive/$pkgver.tar.gz")

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
sha256sums=('fd78984ae0186a86f76f59b74701bdf6635cfd79e09cc510862973b2a11141e2')

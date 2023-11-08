# Maintainer: realroot <scorpion2185@protonmail.com>

pkgname=smlock
pkgver=0.7.5
pkgrel=1
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
sha256sums=('1b0ed9ae80ef5227d3e2e94daa2d5f3851c53e92137a359a7592e415a143ecf6')

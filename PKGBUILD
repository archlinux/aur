# Maintainer: realroot <scorpion2185@protonmail.com>

pkgname=smlock
pkgver=0.7
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
sha256sums=('11f4dcc0601a0a6bc5ef2b7e6b91c251e94bfa4a56a9c724a0f7cdb06b901911')

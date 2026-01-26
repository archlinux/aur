# Maintainer: nvlli <nvllvs0 at gmail dot com>

pkgname=nvspeed-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A minimal Nvidia GPU fan speed controller written in C"
arch=(x86_64)
url="https://github.com/iakobvs/nvspeed"
license=('MIT')
depends=(cuda)
makedepends=(git
	make)
optdepends=()
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd nvspeed
	make
}

package() {
	cd nvspeed
	make DESTDIR="$pkgdir/" install
}

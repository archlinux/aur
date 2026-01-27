# Maintainer: nvlli <nvllvs0 at gmail dot com>

pkgname=cfan-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A minimal fan speed controller written in C"
arch=(x86_64)
url="https://github.com/iakobvs/cfan"
license=('MIT')
makedepends=(git
	make)
source=("git+$url")
sha256sums=('SKIP')

package() {
	cd cfan
	make DESTDIR="$pkgdir/" install
}

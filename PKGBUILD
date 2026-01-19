# Maintainer: nvlli <nvlli4096 at gmail dot com>

pkgname=dwmblocks-fast-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="dwmblocks-fast is a modular status bar for window managers (fork of dwmblocks)"
arch=(x86_64)
url="https://github.com/iakobvs/dwmblocks-fast"
license=('ISC')
depends=(cuda
	alsa-lib
	libx11)
makedepends=(git
	make)
optdepends=('dwm: print to the dwm status bar')
source=("git+$url")
sha256sums=('SKIP')

package() {
	cd dwmblocks-fast
	make DESTDIR="$pkgdir/" install
}

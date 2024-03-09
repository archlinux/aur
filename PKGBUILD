# Alfred Roos alfred@stensatter.se
pkgname=imagine-term-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Imagine is a program that displays images and video in the terminal."
arch=(x86_64)
url="https://gitlab.com/spynets1/imagine"
license=('GPL-3.0-or-later')
groups=()
depends=(ffmpeg)
makedepends=(git gcc)
checkdepends=()
optdepends=()
provides=()
conflicts=(imagine)
md5sums=()

prepare() {
	git clone https://gitlab.com/spynets1/imagine
}

build() {
	cd imagine
	make
}

package() {
	cd imagine
	install -Dm755 ./imagine "$pkgdir/usr/bin/imagine"
}


pkgname=imager-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Image and video viewer in terminal"
arch=(x86_64)
url="https://gitlab.com/spynets1/imager"
license=('GPL-3.0-or-later')
makedepends=(git gcc)
md5sums=()

prepare() {
	git clone https://gitlab.com/spynets1/imager
}

build() {
	cd imager
	make
}

package() {
	cd imager
	install -Dm755 ./imager "$pkgdir/usr/bin/imager"
}

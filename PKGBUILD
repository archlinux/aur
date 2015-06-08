# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
pkgname=iocane
pkgver=0.5
pkgrel=1
pkgdesc="Simulate X11 mouse events from keyboard"
url="http://github.com/TrilbyWhite/Iocane.git"
arch=('any')
license=('GPL3')
depends=('libx11')
source=('https://github.com/TrilbyWhite/Iocane/raw/master/'$pkgname-$pkgver'.tar.gz')
sha256sums=('9d032472aa246e055f006634350800f663bba4d8d27f363017a1170527be157e')

build() {
	cd "${srcdir}"
	make
}

package() {
	cd "${srcdir}"
	make DESTDIR="${pkgdir}" install
}


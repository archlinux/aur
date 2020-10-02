# Maintainer: mirkobrombin <send@mirko.pm>

pkgname=asus-nb-ctrl
pkgver=20201002
pkgrel=1
pkgdesc='asusd is a utility for Linux to control many aspects of various ASUS laptops'
arch=('x86_64')
url='https://github.com/mirkobrombin/asus-nb-ctrl'
license=('GPL3')
depends=(rust libusb)
makedepends=('git')

source=(git://gitlab.com/asus-linux/asus-nb-ctrl.git)
sha512sums=('SKIP')

build() {
	cd "${srcdir}/asus-nb-ctrl"
	make
}

package() {
	cd "${srcdir}/asus-nb-ctrl"
	make install
}

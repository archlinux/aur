# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.29.3
pkgrel=2
pkgdesc="BeakerLib is a shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=('perl')
source=("https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f792b86bac8be1a4593dd096c32c1a061102c802c6f5760259a5753b13f6caa1')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	cd "${_srcdir}"
	make DD="${pkgdir}" install
}

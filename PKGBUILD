# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.29
pkgrel=1
pkgdesc="BeakerLib is a shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=()
source=("https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3e3babd11a5ee4dec21f1c3d4fff775cd83f519af3739a7b8c7a32ed34d15708')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	cd "${_srcdir}"
	make DD="${pkgdir}" install
}

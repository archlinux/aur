# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.29.2
pkgrel=1
pkgdesc="BeakerLib is a shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=('perl')
source=("https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5f86a885b3f42144c277061eaa6865f707025cf5293c2bc55c14fedfe06e54c9')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	cd "${_srcdir}"
	make DD="${pkgdir}" install
}

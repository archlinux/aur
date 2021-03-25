# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.26
pkgrel=1
pkgdesc="BeakerLib is a shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=()
source=("https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ca16f5791f5e1212e97ad710a79cb5b43710efb1989450ab806cbab49c8b50a6')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	cd "${_srcdir}"
	make DD="${pkgdir}" install
}

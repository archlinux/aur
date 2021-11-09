# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.28
pkgrel=1
pkgdesc="BeakerLib is a shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=()
source=("https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('935b7432c52ba4092e70cadac197713d0352404e6fa35780e1ec868b81b3ecf8')

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	make
}

package() {
	cd "${_srcdir}"
	make DD="${pkgdir}" install
}

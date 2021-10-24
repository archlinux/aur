# Maintainer: Romain Lecat <romain.lecat@outscale.com>
pkgname=osc-udev-storage
pkgver=2.0
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname.tar.gz")
noextract=()
sha256sums=('6a711875c76a533d3938ec8e5ad8f3b12f6f1b0d1c2c3ccb91bafd0de563b5ef')
validpgpkeys=()

package() {
	# udev rules
	install -dm 755 "${pkgdir}/etc/udev/rules.d"
	cp "${srcdir}/udev/"*.rules "${pkgdir}/etc/udev/rules.d/"

	# binaries
	install -dm 755 "${pkgdir}/usr/bin"
	cp "${srcdir}/bin/"* "${pkgdir}/usr/bin/"
}

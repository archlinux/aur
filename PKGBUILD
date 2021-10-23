# Maintainer: Romain Lecat <romain.lecat@outscale.com>
pkgname=osc-udev-storage
pkgver=1.0
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
sha256sums=('ded0c66c0b5b5f7e0d4b0af26ebdea0c77f9d6ca4eff95497eaefa06371e092b')
validpgpkeys=()

package() {
	# udev rules
	install -dm 755 "${pkgdir}/etc/udev/rules.d"
	cp "${srcdir}/udev/"*.rules "${pkgdir}/etc/udev/rules.d/"

	# binaries
	install -dm 755 "${pkgdir}/bin"
	cp "${srcdir}/bin/"* "${pkgdir}/bin/"
}

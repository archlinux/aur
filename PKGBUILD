# Maintainer: tsabme <me@tsablezub.ru>
pkgname=tsl-amd
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Helper for tsab.label"
arch=('any')
url="https://github.com/tsablez/tsl-amd"
license=('GPL3')
groups=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(tsl-amd.sh::https://raw.githubusercontent.com/tsablez/tsl-amd/refs/heads/main/tsl-amd.sh)
noextract=()
validpgpkeys=()

package() {
	install -d "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/tsl-amd.sh" "${pkgdir}/usr/bin/tsl-amd"
}
sha256sums=('f60fb83720a83d4a91b8d9e53fcfa3236c0fee213bf9d96b6055ac313a28e0d3')

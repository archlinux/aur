# Maintainer: tsabme <me@tsablezub.ru>
pkgname=tsl-amd
pkgver=1.2
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
sha256sums=('dc8a7b1c9f78dd1cfa27c2529961cdacaeda14dfdde92eebaf2ba77c98104908')

# Maintainer: tsabme <me@tsablezub.ru>
pkgname=tsl-amd
pkgver=1.1
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
sha256sums=('2203f9003af47e4befa60cf0dfea27705eed26020f626d049d7900bd4b1bd1a3')

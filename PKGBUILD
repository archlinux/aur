# Maintainer: Mohammed Chelouti <m.chelouti@bluewin.ch>
pkgname=tasklite-bin
pkgver='0.3.0.0'
pkgrel=1
epoch=
pkgdesc="The CLI task manager for power users"
arch=('x86_64')
url="https://tasklite.org/"
license=('AGPL-3.0')
groups=()
depends=()
makedepends=(unzip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ad-si/TaskLite/releases/download/v${pkgver}/tasklite_linux_${arch}.zip")
noextract=()
sha256sums=('b6757655fbbf85f31cacea399d32c726740f7bd02803244b00c5e1d56576438b')
validpgpkeys=()

prepare() {
    unzip tasklite_linux_${arch}.zip
}

package() {
    install tasklite -D ${pkgdir}/usr/bin/tasklite
}

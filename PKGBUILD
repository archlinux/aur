# Maintainer: Mohammed Chelouti <m.chelouti@bluewin.ch>
pkgname=tasklite-bin
pkgver='0.4.0.0'
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
sha256sums=('fab70c3874e9ee38864f3eb23d0b826956e0d6ce90baa6a27a881cf7ffba1c68')
validpgpkeys=()

prepare() {
    unzip tasklite_linux_${arch}.zip
}

package() {
    install tasklite -D ${pkgdir}/usr/bin/tasklite
}

# Maintainer: Mohammed Chelouti <m.chelouti@bluewin.ch>
pkgname=tasklite-bin
pkgver='0.5.0.0'
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
provides=(tasklite)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ad-si/TaskLite/releases/download/v${pkgver}/tasklite_linux_${arch}.zip")
noextract=()
sha256sums=('cec201eb783678b4bd66718717bf599c15aa4084be5ec0f137d12230e1dbce1b')
validpgpkeys=()

prepare() {
    unzip tasklite_linux_${arch}.zip
}

package() {
    install tasklite -D ${pkgdir}/usr/bin/tasklite
}

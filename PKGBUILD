# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.8
pkgrel=1
epoch=
pkgdesc="ROM package for CraftOS-PC"
arch=('any')
url="https://github.com/MCJack123/craftos2-rom"
license=('CCPL')
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
source=("https://github.com/MCJack123/craftos2-rom/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('207b6d15d1039343a548e3dfdbaecaa49760b087afbd10f5548a7429a7fa2973')
validpgpkeys=()

prepare() {
    true
}

build() {
    true
}

check() {
    true
}

package() {
    mkdir -p "$pkgdir/usr/share/craftos"
    cp -R craftos2-rom-$pkgver/* "$pkgdir/usr/share/craftos/"
}

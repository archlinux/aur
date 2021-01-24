# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.5.2
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
sha256sums=('5b182cab256a2b9d7c666f429fc4e67bd0b79370dfc7028d2e3c5a8d329bc33a')
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

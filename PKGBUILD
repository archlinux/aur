# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
pkgname=craftos-pc-data
pkgver=2.2.5
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
sha256sums=('a16a8d41515bc4011755e9e1a4c7e935651e9840ce0d6f9fce8acbdf8840b823')
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

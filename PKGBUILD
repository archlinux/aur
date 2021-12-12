# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.6.3
pkgrel=2
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
sha256sums=('89ab3f7e407d466a820af9182fbc27770ddcf9e2282fee44fd14fa739ed712aa')
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
    sed 's/\\0/%z/g' < craftos2-rom-$pkgver/rom/apis/textutils.lua > "$pkgdir/usr/share/craftos/rom/apis/textutils.lua"
}

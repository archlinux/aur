# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.8.1
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
sha256sums=('225b2c6706b36995318549bd4f26abc11012411ce211590917f8607e7ca1ba54')
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

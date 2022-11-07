# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.7.2
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
sha256sums=('5d712b37d307e667f96cc76cad9e3b0da30b5bd6dc1385f6a787b38de20914fb')
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

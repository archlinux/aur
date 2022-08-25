# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.7
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
sha256sums=('56335a0319eb489f67cd72fef311d0d3079db65e9ca1dad24b80f5513ae1b4c1')
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

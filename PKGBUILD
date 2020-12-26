# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
# Contributor: Jonathan Coates <contact@squiddev.cc>
pkgname=craftos-pc-data
pkgver=2.5
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
sha256sums=('47645947afd7cec1e0cd9651baa4a355a2ae791e4db7daac17053cf4d798af01')
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

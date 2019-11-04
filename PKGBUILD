# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
# Contributor: Daniel Ratcliffe <dratcliffe@gmail.com>
pkgname=craftos-pc-data
pkgver=2.1.2
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
source=("https://github.com/MCJack123/craftos2-rom/archive/v2.1.2.tar.gz")
noextract=()
sha256sums=('8e9dae90dea7913cdb7bcb314d3e10b66bbd8f9d79d44bfc5c745edcc1fb9e4b')
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

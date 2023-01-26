# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=craftos-pc-bin
pkgver=2.7.2
pkgrel=1
epoch=
pkgdesc="Advanced ComputerCraft emulator written in C++ (AppImage binary)"
arch=('x86_64')
url="https://www.craftos-pc.cc/"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=(craftos-pc)
conflicts=(craftos-pc)
replaces=()
backup=()
options=()
install=
changelog=
source=("CraftOS-PC_${pkgver}.AppImage::https://github.com/MCJack123/craftos2/releases/download/v${pkgver}/CraftOS-PC.x86_64.AppImage")
noextract=('CraftOS-PC.x86_64.AppImage')
sha256sums=('1136e07e7e667337521544642d9c83ae50ab47694682461c109d6076248cc0f4')
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
    install -D -m 0755 CraftOS-PC_$pkgver.AppImage "$pkgdir/usr/bin/craftos"
}

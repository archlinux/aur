# Maintainer: Tyler "Tyzoid" Dence <tyler@tyzoid.com>
pkgname=btw
pkgver=1.0
pkgrel=1
pkgdesc="Adds 'Btw' to 'Arch Linux' strings"
arch=("any")
url="https://github.com/tyzoid/btw"
license=('MIT')
optdepends=(neofetch lsb-release)
source=("git+https://github.com/tyzoid/btw.git#tag=v$pkgver")
validpgpkeys=("F2955C3B63EE4E421F30670A3B08EFC6BA974CFC")
sha256sums=("SKIP")

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

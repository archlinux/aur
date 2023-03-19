# Maintainer: 0x454d505459 <testerthe60@gmail.com>
pkgname=swirl-bin
pkgver=0.0.4
pkgstage="alpha"
pkgrel=1
pkgdesc="A High Level, statically typed, Compiled programming language "
arch=("x86_64")
url="https://github.com/SwirlLang/Swirl"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("swirl")
conflicts=("swirl")
replaces=()
source=("swirl::https://github.com/SwirlLang/Swirl/releases/download/v${pkgver}-${pkgstage}/swirl-linux")
md5sums=("810d7e3f525782c4a939f99ec5ba02c5")

package() {
	install -Dm 755 swirl "$pkgdir/usr/bin/swirl"
}


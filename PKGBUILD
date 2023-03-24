# Maintainer: 0x454d505459 <testerthe60@gmail.com>
pkgname=swirl-bin
pkgver=0.0.5
pkgstage="alpha"
pkgrel=1
pkgdesc="A High Level, statically typed, Compiled programming language "
arch=("x86_64")
url="https://github.com/SwirlLang/Swirl"
license=('GPLv3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("swirl")
conflicts=("swirl")
replaces=()
source=("swirl::https://github.com/SwirlLang/Swirl/releases/download/v${pkgver}-${pkgstage}/swirl-linux")
md5sums=("4cbb4834ab4c2dbb1fc57c006561de91")

package() {
	install -Dm 755 swirl "$pkgdir/usr/bin/swirl"
}


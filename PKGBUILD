# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=1.2
pkgrel=2
epoch=1
pkgdesc="Clipboard manager to use with rofi"
arch=('x86_64')
url="https://github.com/erebe/greenclip"
license=('GPL')
groups=()
depends=('rofi')
makedepends=()
checkdepends=()
optdepends=()
provides=("greenclip")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://github.com/erebe/greenclip/releases/download/1.2/greenclip")
noextract=()
sha256sums=("faffc5aa615bd53effa40667989d4b9847307e4e3455ed4c031955881589efdd")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


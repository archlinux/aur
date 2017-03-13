# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=1.1
pkgrel=1
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
source=("https://github.com/erebe/greenclip/releases/download/1.1/greenclip")
noextract=()
sha256sums=("b90c920fe3c1c55210006a7ea3180ee108a575be66f4923d00f3794baf77abb0")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


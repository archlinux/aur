# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=2.1
epoch=0
pkgrel=0
pkgdesc="Clipboard manager to use with rofi"
arch=('x86_64')
url="https://github.com/erebe/greenclip"
license=('GPL')
groups=()
depends=('rofi')
makedepends=()
checkdepends=()
optdepends=()
provides=("rofi-greenclip")
conflicts=("greenclip")
replaces=("greenclip")
backup=()
options=('!strip')
install=
changelog=changelog
source=("https://github.com/erebe/greenclip/releases/download/2.1/greenclip")
noextract=()
sha256sums=("9964a6520f3ec6c935e3f6ef4b4b6235d79aab38060305673a66a5c71e7c9e57")

package() {
        install -Dm 755 greenclip "$pkgdir/usr/bin/greenclip"
}


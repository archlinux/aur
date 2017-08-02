# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=2.0
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
provides=("greenclip")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=changelog
source=("https://github.com/erebe/greenclip/releases/download/2.0/greenclip")
noextract=()
sha256sums=("2b67042439c4af86fd8ec0fa37f029c200811017d439cc9acb7125dc599406cf")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


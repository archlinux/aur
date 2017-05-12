# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=1.3
pkgrel=2
epoch=2
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
source=("https://github.com/erebe/greenclip/releases/download/1.3/greenclip")
noextract=()
sha256sums=("d28a1fbe779d10822c7fadcb20e490e2ef9acd1931bf5dc92f11d25c2413f39d")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


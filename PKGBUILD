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
sha256sums=("ec4e5603f602faa169e5da1995bebaea080eb8293dd6f0ea39b2af20811e519d")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


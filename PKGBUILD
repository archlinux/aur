# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=greenclip
pkgver=1.3
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
changelog=changelog
source=("https://github.com/erebe/greenclip/releases/download/1.3/greenclip")
noextract=()
sha256sums=("830e5ff51a6726b8acd093bdfca9ae82fbebdfc37b7f7af4b6bf9a95475b776b")

package() {
        install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


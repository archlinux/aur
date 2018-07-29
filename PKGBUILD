# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=3.1
epoch=1
pkgrel=0
pkgdesc="Clipboard manager to use with rofi - Image support and blacklist"
arch=('x86_64')
url="https://github.com/erebe/greenclip"
license=('GPL')
groups=()
changelog=changelog
depends=('rofi')
makedepends=()
checkdepends=()
optdepends=()
provides=("greenclip")
conflicts=("rofi-greenclip-beta")
replaces=("rofi-greenclip-beta")
backup=()
options=('!strip')
source=("https://github.com/erebe/greenclip/releases/download/3.1/greenclip")
noextract=()
sha256sums=("bb34c21bfd809ef6c4ad9113ebbcf8cd6062adbe710c97fc3e85e966965850e7")

package() {
        install -Dm 755 greenclip "$pkgdir/usr/bin/greenclip"
}


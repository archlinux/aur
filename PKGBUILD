# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=3.1
epoch=0
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
sha256sums=("ffedb7a027fca7fa586b0e354a46bd32100605819a40c1d14b06e3a14a068080")

package() {
        install -Dm 755 greenclip "$pkgdir/usr/bin/greenclip"
}


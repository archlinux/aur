# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=3.2
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
source=("https://github.com/erebe/greenclip/releases/download/3.2/greenclip")
noextract=()
sha256sums=("18447e96c1fb0afebaa42507e59a2780fc4fdb2e88a44e84421cd1727648c443")

package() {
        install -Dm 755 greenclip "$pkgdir/usr/bin/greenclip"
}


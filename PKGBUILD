# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=3.0
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
source=("https://github.com/erebe/greenclip/releases/download/3.0/greenclip")
noextract=()
sha256sums=("a56cbba8e60e972e9db20757554db344de912ff9e7cd72e76d542796b9fa43ed")

package() {
#        kill -9 "$pid_greenclip" || test 1
#        rm -rf ~/.config/greenclip.cfg ~/.cache/greenclip.*
        install -Dm 755 greenclip "$pkgdir/usr/bin/greenclip"
}


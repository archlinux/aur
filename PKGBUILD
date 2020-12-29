# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=3.4
pkgrel=5
pkgdesc="Clipboard manager to use with rofi - Image support and blacklist"
arch=('x86_64')
url="https://github.com/erebe/greenclip"
license=('GPL')
groups=()
changelog=changelog
depends=()
makedepends=()
checkdepends=()
optdepends=('rofi' 'fzf' 'dmenu')
provides=("greenclip")
conflicts=("rofi-greenclip-beta")
replaces=("rofi-greenclip-beta")
backup=()
options=('!strip')
source=("https://github.com/erebe/greenclip/releases/download/3.4/greenclip"
        "greenclip.service")
noextract=()
sha256sums=('6b3d5804be52cd477c8cc1c86f20fcaeb5ba55c89f72f5a690e84d6998dc6583'
            '85ecca9b6f5903ee53615c09802efd389662ddba7ce1febe34302a6a1d87179e')

package() {
        install -Dm755 greenclip "$pkgdir/usr/bin/greenclip"
        install -Dm644 "$srcdir/greenclip.service" "$pkgdir/usr/lib/systemd/user/greenclip.service"
}


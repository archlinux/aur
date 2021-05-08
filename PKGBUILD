# Maintainer: Romain GERARD <erebe@erebe.eu>

pkgname=rofi-greenclip
pkgver=4.1
pkgrel=1
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
source=("https://github.com/erebe/greenclip/releases/download/4.1/greenclip-v4.1"
        "greenclip.service")
noextract=()
sha256sums=('656d136622a52001cc03b6a4f2e378e5719ce6729f8b5cea869b1e8e10d33890'
            '85ecca9b6f5903ee53615c09802efd389662ddba7ce1febe34302a6a1d87179e')

package() {
        install -Dm755 greenclip-v4.1 "$pkgdir/usr/bin/greenclip"
        install -Dm644 "$srcdir/greenclip.service" "$pkgdir/usr/lib/systemd/user/greenclip.service"
}


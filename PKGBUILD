# Maintainer: Aydin

pkgname=wiz-bin
pkgver=0.22.2
pkgrel=1
pkgdesc="Wiz programming language"
arch=('x86_64')
url="https://github.com/aydin-here/wiz"
license=('MIT')

provides=('wiz')
conflicts=('wiz')

source=(
    "wiz-linux::https://github.com/aydin-here/wiz/releases/download/v${pkgver}/wiz-linux"
)

sha256sums=('109729f807059b352be4e711cc3df92eed1cd7b08a3c1ecf856d793224bdafa3')

package() {
    install -Dm755 \
        "$srcdir/wiz-linux" \
        "$pkgdir/usr/bin/wiz"
}

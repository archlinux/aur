# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
pkgname=gobypass403-bin
pkgver=0.8.2
pkgrel=2
pkgdesc="A Go tool to bypass 403 Forbidden errors"
arch=('x86_64')
url="https://github.com/slicingmelon/gobypass403"
license=('MIT')
depends=('go')
source=("https://github.com/slicingmelon/gobypass403/releases/download/v${pkgver}/gobypass403-linux-amd64")
sha256sums=('9293d991c434f1a7375795418e61df65d7a15079d2f719c2c4b0d2d85959e981')

package() {
    install -Dm755 "$srcdir/gobypass403-linux-amd64" "$pkgdir/usr/bin/gobypass403"
}

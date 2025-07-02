# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
pkgname=gobypass403-bin
pkgver=0.8.4
pkgrel=2
pkgdesc="A Go tool to bypass 403 Forbidden errors"
arch=('x86_64')
url="https://github.com/slicingmelon/gobypass403"
license=('MIT')
depends=('go')
source=("https://github.com/slicingmelon/gobypass403/releases/download/v${pkgver}/gobypass403_${pkgver}_linux-amd64")
sha256sums=('77de9cf875559f2f183690c4cb12477858adc872f020c12f7d371f2bd1efde0f')


package() {
    install -Dm755 "$srcdir/gobypass403_${pkgver}_linux-amd64" "$pkgdir/usr/bin/gobypass403"
}

# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
pkgname=gobypass403-bin
pkgver=0.8.4
pkgrel=4
pkgdesc="A Go tool to bypass 403 Forbidden errors"
arch=('x86_64')
url="https://github.com/slicingmelon/gobypass403"
license=('MIT')
source=(
    "https://github.com/slicingmelon/gobypass403/releases/download/v${pkgver}/gobypass403_${pkgver}_linux_amd64"
    "${pkgname}_${pkgver}_LICENSE::https://raw.githubusercontent.com/slicingmelon/gobypass403/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('9a2665b956ac4a70b7f872529f9449ffffe007c197ec0a45a07b6be1caec1db2'
            'fc493b56b5bba910e7912c418dc191fd6a7b91fd23b5d5273bebca6343f2cb84')


package() {
    install -Dm755 "$srcdir/gobypass403_${pkgver}_linux_amd64" "$pkgdir/usr/bin/gobypass403"
    install -Dm644 "$srcdir/${pkgname}_${pkgver}_LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

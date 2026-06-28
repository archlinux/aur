# Maintainer: BoBeR182 <aur AT nullvoid DOT me>
pkgname=gobypass403-bin
pkgver=0.8.8
pkgrel=1
pkgdesc="A Go tool to bypass 403 Forbidden errors"
arch=('x86_64')
url="https://github.com/slicingmelon/gobypass403"
license=('MIT')
source=(
    "https://github.com/slicingmelon/gobypass403/releases/download/v${pkgver}/gobypass403_${pkgver}_linux_amd64"
    "${pkgname}_${pkgver}_LICENSE::https://raw.githubusercontent.com/slicingmelon/gobypass403/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('ad6d0f17f3a6ee3e3a2ad5718fa891b220fc40f9db3e6315b224f9f7531f1240'
            'fc493b56b5bba910e7912c418dc191fd6a7b91fd23b5d5273bebca6343f2cb84')


package() {
    install -Dm755 "$srcdir/gobypass403_${pkgver}_linux_amd64" "$pkgdir/usr/bin/gobypass403"
    install -Dm644 "$srcdir/${pkgname}_${pkgver}_LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

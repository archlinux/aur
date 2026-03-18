pkgname=ymp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="YouTube Media Player and Explorer"
arch=('x86_64')
url="https://github.com/trap251/ymp"
license=('MIT')

source=("https://github.com/trap251/ymp/releases/download/v${pkgver}/ymp-${pkgver}.tar.gz")
sha256sums=('8a33fd345a84d28eda0d122dfc6762ea85c42e30e10b1a7f104506b36858f9c3')

package() {
    cd "$srcdir/ymp-${pkgver}"
    install -Dm755 ymp "$pkgdir/usr/bin/ymp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

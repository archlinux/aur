pkgname=ymp-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="YouTube Media Player and Explorer"
arch=('x86_64')
url="https://github.com/trap251/ymp"
license=('MIT')

source=("https://github.com/trap251/ymp/releases/download/v${pkgver}/ymp-${pkgver}.tar.gz")
sha256sums=('8c04363b3006e76c89f9995a473b7d35081523cac85bcd3fc659d7fe67042b68')

package() {
    cd "$srcdir/ymp-${pkgver}"
    install -Dm755 ymp "$pkgdir/usr/bin/ymp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

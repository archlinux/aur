# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verusfmt-bin
pkgver=0.7.4
pkgrel=1
provides=('verusfmt')
conflicts=('verusfmt')
pkgdesc='An Opinionated Formatter for Verus'
arch=('x86_64')
url='https://github.com/verus-lang/verusfmt'
license=('MIT')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/verusfmt-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('bbc5cb02c01efeaf9e66c93443ae782b11c5d8fd88c67d558c23216222971f4f')

package() {
    cd verusfmt-x86_64-unknown-linux-gnu
    install -Dm755 verusfmt "$pkgdir/usr/bin/verusfmt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

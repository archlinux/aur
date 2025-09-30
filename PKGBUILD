# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verusfmt-bin
pkgver=0.5.7
pkgrel=1
provides=('verusfmt')
conflicts=('verusfmt')
pkgdesc='An Opinionated Formatter for Verus'
arch=('x86_64')
url='https://github.com/verus-lang/verusfmt'
license=('MIT')
source=("$url/releases/download/v$pkgver/verusfmt-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('6ca24d76512425902e7c84ed88e9241bc07a88314bc3298562f99fa34aac3dc8')

package() {
    cd verusfmt-x86_64-unknown-linux-gnu
    install -Dm755 verusfmt "$pkgdir/usr/bin/verusfmt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

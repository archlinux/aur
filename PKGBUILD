# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verusfmt-bin
pkgver=0.6.1
pkgrel=2
provides=('verusfmt')
conflicts=('verusfmt')
pkgdesc='An Opinionated Formatter for Verus'
arch=('x86_64')
url='https://github.com/verus-lang/verusfmt'
license=('MIT')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/verusfmt-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('5ce204ee58e3c65c0646f37dfd4fe50ad89f246c1a954c1b8d2ba80dc3ca0360')

package() {
    cd verusfmt-x86_64-unknown-linux-gnu
    install -Dm755 verusfmt "$pkgdir/usr/bin/verusfmt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verusfmt-bin
pkgver=0.7.2
pkgrel=1
provides=('verusfmt')
conflicts=('verusfmt')
pkgdesc='An Opinionated Formatter for Verus'
arch=('x86_64')
url='https://github.com/verus-lang/verusfmt'
license=('MIT')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/verusfmt-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('c5e0a8e07337055b2469d2878ddcc589da1f4be91348bb1917ce122ea46d4015')

package() {
    cd verusfmt-x86_64-unknown-linux-gnu
    install -Dm755 verusfmt "$pkgdir/usr/bin/verusfmt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

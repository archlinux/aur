# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verusfmt-bin
pkgver=0.6.3
pkgrel=1
provides=('verusfmt')
conflicts=('verusfmt')
pkgdesc='An Opinionated Formatter for Verus'
arch=('x86_64')
url='https://github.com/verus-lang/verusfmt'
license=('MIT')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/verusfmt-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('a4f674ebd8b37833b06f69e051ae20bc56c93aaa3538e194b29498b3e9b2e852')

package() {
    cd verusfmt-x86_64-unknown-linux-gnu
    install -Dm755 verusfmt "$pkgdir/usr/bin/verusfmt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

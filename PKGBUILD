# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=fcp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A significantly faster alternative to the classic Unix cp(1) command."
url="https://github.com/svetlitski/fcp/"
provides=('fcp')
conflicts=('fcp')
arch=('x86_64')
license=('BSD')
source=(
    "${url}/releases/download/v${pkgver}/fcp-$pkgver-x86_64-unknown-linux-gnu.zip"
    "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    'b6975edea3b9abea4fa3409ad7bd69bdb5cd210b2f268f61d1d8ea8ff8b4ddcc'
    'a90158d049b5021f60d31eb029daf74a72f933b73bf867b5f6b344be83d69fdc'
)

package() {
    install -Dm755 "$srcdir/fcp-$pkgver-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/fcp"
    install -Dm644 "$srcdir/fcp-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/fcp/LICENSE"
}


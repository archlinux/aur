# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=fcp-bin
pkgver=0.2.1
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
    'c287303cafff7e6941832950f9b00281eaef0041e0a24eae9c01cd8b2fe5784d'
    'e835d014849f5a3431a0798bcac02332915084bf4f4070fb1c6914b1865295f2'
)

package() {
    install -Dm755 "$srcdir/fcp-$pkgver-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/fcp"
    install -Dm644 "$srcdir/fcp-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/fcp/LICENSE"
}


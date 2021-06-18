# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=fcp-bin
pkgver=0.1.0
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
    'ae7d257c679efaac2ad07dc4fec0efa0afe6bc1654456c4f8e91659f7cf72b54'
    '7e4e69bdb7f1f831dc52cd517afdd5722313d3dece3afd7dad418d224d4badd1'
)

package() {
    install -Dm755 "$srcdir/fcp-$pkgver-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/fcp"
    install -Dm644 "$srcdir/fcp-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/fcp/LICENSE"
}


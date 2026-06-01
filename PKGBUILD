# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="Cross-platform terminal IDE, file manager and virtual terminal (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
provides=('termide')
conflicts=('termide')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/termide/termide/releases/download/$pkgver/termide-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('52e7036bdf469a33e3762006eee22d8a38cc0465b1a9fc0669e4c0a56eb6436d')
sha256sums_aarch64=('6282aa23325e3408fdd1d1302b6a56c6b10959d2b17c289c6c54e3ccc39d8a58')

package() {
    # Install binary
    install -Dm755 termide "$pkgdir/usr/bin/termide"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/termide/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/termide/LICENSE"
}

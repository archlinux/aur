# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.7.0-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3c95bb43448e5b48122e02f3623d4aa6a23c3774ab08cdcea2578a0838262cb0')
source_aarch64=("trx-bin-0.7.0-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('0508d43bcd3762fef5809f13c624fe6ac4f0cc3c4754bb75f8a76d6f2c70a949')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

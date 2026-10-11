# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.8.3-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c7ca8eea61beded1e24fe57a17e10af8c9e01824c5f2e659d1e2d205147cf754')
source_aarch64=("trx-bin-0.8.3-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('7a97582e590b78f6564a7393e00df44accd7a7ddd471c0c6ac3d432536f8535a')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

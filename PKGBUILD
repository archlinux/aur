# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.6.3-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0237437cd30ead32f8f5511912ed118596e2107ed9b9cf955cba5b31dacab4ea')
source_aarch64=("trx-bin-0.6.3-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('42a502f114ff206e2d32e674e817030afd7af298cfec442fec6309d2e200acf3')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

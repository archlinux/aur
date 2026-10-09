# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.8.2-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('78714a0edc35c8b8df5e607f44c545074f1f53b9f231624ee623ebadbd410a4a')
source_aarch64=("trx-bin-0.8.2-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('565b0d206bdd4a414b378438dffe865fd031dd70a5dcaa181d50d86653431571')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

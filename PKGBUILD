# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.9.0-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dd105a60ec12a443a4d2c549a64ca3302a59b228805a85a5d049e0342ec3a2e4')
source_aarch64=("trx-bin-0.9.0-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('db69b2152dd70e07e0660c402d621e3cfd9839e6b674e4e8a02d6748364a260f')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

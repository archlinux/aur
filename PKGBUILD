# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.8.1-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e90c3e61c29ff7f8890ad81e0861a39648adf841d3ea9311d882294b33a7dc30')
source_aarch64=("trx-bin-0.8.1-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('388c7f2f03dae2a430d13627b5eea9aec834ef859b84ff5b67d4551e6a3d13e4')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

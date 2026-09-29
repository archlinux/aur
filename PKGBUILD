# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.7.1-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0ced702fd9bbe633fbe5dc13aca0b4364db88ef01695b7422f17b3c2edfad0ec')
source_aarch64=("trx-bin-0.7.1-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('c4b63f1796e1f36b8a079e8731cbab8c7670b80cc7559d763484dff74a564b8e')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

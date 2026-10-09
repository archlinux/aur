# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=trx-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Minimal git-backed issue tracker with TUI viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/trx"
license=('MIT')
provides=('trx')
conflicts=('trx' 'trx-git')
source_x86_64=("trx-bin-0.8.0-x86_64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('99204bf85960a0e6e129145227b93fd3d7750b0f49242c9c609a184fde6ab34f')
source_aarch64=("trx-bin-0.8.0-aarch64.tar.gz::https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a22baccbdaa578089bbdc1d27217853fe7ce957e92f041d7ffb9fe9c93736694')

package() {
    cd "$srcdir"
    install -Dm755 */bin/trx "$pkgdir/usr/bin/trx"
    install -Dm755 */bin/trx-tui "$pkgdir/usr/bin/trx-tui"
    install -Dm755 */bin/trx-mcp "$pkgdir/usr/bin/trx-mcp"
    install -Dm755 */bin/trx-api "$pkgdir/usr/bin/trx-api"
}

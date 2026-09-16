# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=skdlr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform task scheduler CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/skdlr"
license=('MIT')
provides=('skdlr')
conflicts=('skdlr')
depends=('gcc-libs')
source_x86_64=("skdlr-bin-0.3.0-x86_64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4c23846664cf831f594d707e1dbb4166d39ba5d6b04c8321082544a1a2a77439')
source_aarch64=("skdlr-bin-0.3.0-aarch64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('b1c09c120200980f8dec6f48293ff3de3e9238c6f2ca5034f20fd07c9b0fb1da')

package() {
    cd "$srcdir"
    install -Dm755 */bin/skdlr "$pkgdir/usr/bin/skdlr"
    install -Dm755 */bin/skdlr-api "$pkgdir/usr/bin/skdlr-api"
    install -Dm755 */bin/skdlr-mcp "$pkgdir/usr/bin/skdlr-mcp"
    install -Dm755 */bin/skdlr-service "$pkgdir/usr/bin/skdlr-service"
    install -Dm755 */bin/skdlr-tui "$pkgdir/usr/bin/skdlr-tui"
}

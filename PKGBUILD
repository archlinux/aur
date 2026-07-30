# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=skdlr-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Cross-platform task scheduler CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/skdlr"
license=('MIT')
provides=('skdlr')
conflicts=('skdlr')
depends=('gcc-libs')
source_x86_64=("skdlr-bin-0.2.8-x86_64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6979fc4d66aeadff86457c64459d3f2746c84288794a0092b55099d86412467e')
source_aarch64=("skdlr-bin-0.2.8-aarch64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a07bc145640ab3899794e41360e5b1a362ef9385ff30de706d65fbb09692fa10')

package() {
    cd "$srcdir"
    install -Dm755 */bin/skdlr "$pkgdir/usr/bin/skdlr"
    install -Dm755 */bin/skdlr-api "$pkgdir/usr/bin/skdlr-api"
    install -Dm755 */bin/skdlr-mcp "$pkgdir/usr/bin/skdlr-mcp"
    install -Dm755 */bin/skdlr-service "$pkgdir/usr/bin/skdlr-service"
    install -Dm755 */bin/skdlr-tui "$pkgdir/usr/bin/skdlr-tui"
}

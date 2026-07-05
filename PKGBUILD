# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=skdlr-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Cross-platform task scheduler CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/skdlr"
license=('MIT')
provides=('skdlr')
conflicts=('skdlr')
depends=('gcc-libs')
source_x86_64=("skdlr-bin-0.2.7-x86_64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e22ea165d751c9d206d9c792ad65b160f1dcb3d7eb8ce40551dabc28ee388949')
source_aarch64=("skdlr-bin-0.2.7-aarch64.tar.gz::https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('271bd2d3b764ad12002973f602f123997e12c58d1807c41d47cbc375741a0714')

package() {
    cd "$srcdir"
    install -Dm755 */bin/skdlr "$pkgdir/usr/bin/skdlr"
    install -Dm755 */bin/skdlr-api "$pkgdir/usr/bin/skdlr-api"
    install -Dm755 */bin/skdlr-mcp "$pkgdir/usr/bin/skdlr-mcp"
    install -Dm755 */bin/skdlr-service "$pkgdir/usr/bin/skdlr-service"
    install -Dm755 */bin/skdlr-tui "$pkgdir/usr/bin/skdlr-tui"
}

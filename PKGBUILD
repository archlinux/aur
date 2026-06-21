# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source=("sldr-${pkgver}.tar.gz::https://github.com/byteowlz/sldr/releases/download/v${pkgver}/sldr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('085c3a7031301d122349e45bc2947161579389916f24a5e99a9c659847a5e410')

package() {
    install -Dm755 sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 sldr-server "$pkgdir/usr/bin/sldr-server"
}

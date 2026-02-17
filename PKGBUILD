# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source=("sldr-${pkgver}.tar.gz::https://github.com/byteowlz/sldr/releases/download/v${pkgver}/sldr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4b8e2e650805c9572350b228aaf5dcf2a90ae9ceff5042672b9f85a30ade7fa1')

package() {
    install -Dm755 sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 sldr-server "$pkgdir/usr/bin/sldr-server"
}

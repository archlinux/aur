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
sha256sums=('9ec7cac20634e4eea8bf8c31be34f3844aed2662891dcc4382b810e60652d66a')

package() {
    install -Dm755 sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 sldr-server "$pkgdir/usr/bin/sldr-server"
}

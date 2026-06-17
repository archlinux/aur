# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source=("sldr-${pkgver}.tar.gz::https://github.com/byteowlz/sldr/releases/download/v${pkgver}/sldr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('03f8e48f3e2d0f8e49590fc3cd07cd439eef7d9a861abe2ba44bad9b6b12aef0')

package() {
    install -Dm755 sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 sldr-server "$pkgdir/usr/bin/sldr-server"
}

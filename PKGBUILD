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
sha256sums=('d389ec9fabc818a2c4323f842b3cd11098af1cb833d515794e6ba77302ac66a0')

package() {
    install -Dm755 sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 sldr-server "$pkgdir/usr/bin/sldr-server"
}

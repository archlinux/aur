# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source_x86_64=("sldr-bin-0.8.1-x86_64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1713552e3506057952993f718ecaa99fa186ae3b076f97838958dff3342a6aa1')
source_aarch64=("sldr-bin-0.8.1-aarch64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('35b27d0c724219b2d8ac3da54dd8c7e99968c4bf84581b2305d351eb0cdafd26')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 */bin/sldr-server "$pkgdir/usr/bin/sldr-server"
}

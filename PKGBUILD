# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sldr-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Modular markdown presentations powered by slidev"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sldr"
license=('MIT')
provides=('sldr')
conflicts=('sldr')
source_x86_64=("sldr-bin-0.9.1-x86_64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('88ec1ce3c819c26e2a325166198c0c71f9753232bb81df30a31fe0b1769e1f16')
source_aarch64=("sldr-bin-0.9.1-aarch64.tar.gz::https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('c188bd22ebc1c2ad88a91de4fa97d26046b5ae395e35228ae4346d64cb885906')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sldr "$pkgdir/usr/bin/sldr"
    install -Dm755 */bin/sldr-server "$pkgdir/usr/bin/sldr-server"
}

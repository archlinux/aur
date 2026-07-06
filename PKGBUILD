# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source_x86_64=("sx-search-bin-2.5.0-x86_64.tar.gz::https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('668c920d27f32d27d4226b3ac1816820bc22da1c8356714af1820c392c7c66af')
source_aarch64=("sx-search-bin-2.5.0-aarch64.tar.gz::https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('2a69bc7af43511f7c3b822e682a79db0b40c1080da60929754401b8faa33775c')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sx "$pkgdir/usr/bin/sx"
}

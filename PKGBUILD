# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source_x86_64=("sx-search-bin-2.4.2-x86_64.tar.gz::https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3e59ee5233456f0cf5efd7ac443e536fbc944a1dd1891caf19fe1da149a3442f')
source_aarch64=("sx-search-bin-2.4.2-aarch64.tar.gz::https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a2ccaea4da8676cf73e631e5eda6895518435bbd2feb1d2a3ca9bff3af55e8a3')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sx "$pkgdir/usr/bin/sx"
}

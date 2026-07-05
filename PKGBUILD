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
sha256sums_x86_64=('7fbb48578c737d60dadaeae1c9181ba208c8e5e2f4451d0a7799289c98d36e58')
source_aarch64=("sx-search-bin-2.5.0-aarch64.tar.gz::https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('cf40b0f3a1599ce01386871bf45484b4087a3ced5974579d0203aadfa427807f')

package() {
    cd "$srcdir"
    install -Dm755 */bin/sx "$pkgdir/usr/bin/sx"
}

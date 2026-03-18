# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source=("sx-${pkgver}.tar.gz::https://github.com/byteowlz/sx/releases/download/v${pkgver}/sx_Linux_x86_64.tar.gz")
sha256sums=('e2438b0edb27e8de5a30c7b7b608ddbf3e5da57a5efa61f13288c83fdfc2b2cc')

package() {
    install -Dm755 sx "$pkgdir/usr/bin/sx"
}

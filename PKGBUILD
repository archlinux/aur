# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source=("sx-${pkgver}.tar.gz::https://github.com/byteowlz/sx/releases/download/v${pkgver}/sx_Linux_x86_64.tar.gz")
sha256sums=('844c4b8b67207b673deb646947b1351af42905bc82bbe4f9ee07e1833ed07877')

package() {
    install -Dm755 sx "$pkgdir/usr/bin/sx"
}

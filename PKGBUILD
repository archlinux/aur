# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source=("sx-${pkgver}.tar.gz::https://github.com/byteowlz/sx/releases/download/v${pkgver}/sx_Linux_x86_64.tar.gz")
sha256sums=('fbb749fb253a5919c30f986840b4a1e0ff5734d0c398270d4a51dcbc2f3924d4')

package() {
    install -Dm755 sx "$pkgdir/usr/bin/sx"
}

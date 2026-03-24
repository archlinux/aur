# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx-search-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx' 'sx-search')
source=("sx-${pkgver}.tar.gz::https://github.com/byteowlz/sx/releases/download/v${pkgver}/sx_Linux_x86_64.tar.gz")
sha256sums=('d87fd650bfda668159859e44f18486ef3b2fac493906624f5f4deb02cb589f84')

package() {
    install -Dm755 sx "$pkgdir/usr/bin/sx"
}

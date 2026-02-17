# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=sx-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Multi-engine web search from the command line"
arch=('x86_64')
url="https://github.com/byteowlz/sx"
license=('MIT')
provides=('sx')
conflicts=('sx')
source=("sx-${pkgver}.tar.gz::https://github.com/byteowlz/sx/releases/download/v${pkgver}/sx_Linux_x86_64.tar.gz")
sha256sums=('848a7072f6825bf137b292079e21ceba6b27e1680e8a55a2420d0b7ddd6e2c42')

package() {
    install -Dm755 sx "$pkgdir/usr/bin/sx"
}

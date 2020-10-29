# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url='https://github.com/distribyted/distribyted'
license=('GPL3')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('9fbb56b2af1c7899ef183f283f0facfcd724cf8d6a700724d777d28212996faf')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/distribyted"
}

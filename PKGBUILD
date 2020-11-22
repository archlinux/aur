# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url='https://github.com/distribyted/distribyted'
license=('GPL3')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('027cb3bd58dd5ca7317ec49759dc01da11507f7bc9422c732b73c6046fcc50c4')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/distribyted"
}

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=distribyted-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Torrent client with on-demand file downloading as a filesystem"
arch=('x86_64')
url='https://github.com/distribyted/distribyted'
license=('GPL3')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/distribyted/distribyted/releases/download/v${pkgver}/distribyted-v${pkgver}-linux-amd64")
sha256sums=('2b4d053a1e3628e8fde8fc3a4a4bdee3b68aaacafba57fb03e42d9d14f4e2798')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/distribyted"
}

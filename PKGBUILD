# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=podsync-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Turn YouTube or Vimeo channels, users, or playlists into podcast feeds"
arch=('x86_64')
url='https://github.com/mxpv/podsync'
license=('MIT')
provides=('podsync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mxpv/podsync/releases/download/v${pkgver}/Podsync_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('37e469fbb7592840ea6fd35815402a5b287068cbc8921f504c5629a74d592f29')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 podsync "${pkgdir}/usr/bin/podsync"
}
# Maintainer: Artem Vasilev <artem.vasilev@rwth-aachen.de>
# Creator:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=podsync-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Turn YouTube or Vimeo channels, users, or playlists into podcast feeds"
arch=('x86_64')
url='https://github.com/mxpv/podsync'
license=('MIT')
provides=('podsync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mxpv/podsync/releases/download/v${pkgver}/Podsync_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('78b8788d37532850d2424d11926e16a9db70d3929ecfc471ae06808823676203')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 podsync "${pkgdir}/usr/bin/podsync"
}

# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.30.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e588481b888cdf62e29e28c1ee9005b5fae971c31ad9f0132b4292ae7010a7aa')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:

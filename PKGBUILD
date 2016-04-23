# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.34.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('75cacc3a34f1f38c7adb4159c9f6c11ea18c06729804ed4c98f6dd9b1faaaaf9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:

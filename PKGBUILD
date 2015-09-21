# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.31.0
pkgrel=2
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a36b9229d714aa07b956bcac3bff15104b64a704970388864fd1cc25b708a150')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:

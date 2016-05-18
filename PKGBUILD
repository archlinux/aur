# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.35.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a9b58a204f33a3338832cc6fe50228a823c6c6de9193a36522bdfe91fbe7dc15')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:

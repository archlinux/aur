# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=9.0.0
pkgrel=1
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('001a72c3eadc9b6d624f6baa9e7ef56671361ccd847e6407c9a720a7ef9943e2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr/local"
}

# vim:set ts=2 sw=2 et:

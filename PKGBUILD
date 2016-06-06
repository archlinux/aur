# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=8.6.2
pkgrel=1
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('14e97591d34b73f74f47a14e1f12d94ec59226f54fe88572b8d9edcd71392131')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --user root -g --prefix "${pkgdir}/usr/local"
}

# vim:set ts=2 sw=2 et:

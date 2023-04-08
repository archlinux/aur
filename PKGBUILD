# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler-bin
pkgver=12.0
pkgrel=3
pkgdesc="Map Tiler Desktop - software for converting your data into zoomable maps"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('custom')
depends=('gdal' 'libwebp')
options=(!strip)
makedepends=('dpkg')
provides=("maptiler=${pkgver}")
conflicts=('maptiler')
replaces=('maptiler-64bit')
_pkgname="${pkgname}-engine-${pkgver}-app-linux.deb"
# source=("https://maptiler.download/desktop/${_pkgname}")
source=("https://maptiler.download/engine/maptiler-engine-${pkgver}-app-linux.deb")
sha256sums=('6adda65dd37646f5aad3e4dedbdf027c0c4655a86e8972b415e2b248b0bfbb47')

package() {
  dpkg -x "${pkgname%-bin}-engine-${pkgver}-app-linux.deb" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

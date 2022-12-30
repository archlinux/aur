# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler
pkgver=12.0
pkgrel=1
pkgdesc="Map Tiler Desktop - software for converting your data into zoomable maps"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('custom')
depends=('gdal' 'libwebp')
options=(!strip)
makedepends=('dpkg')
replaces=('maptiler-64bit')
_pkgname="${pkgname}-engine-${pkgver}-app-linux.deb"
# source=("https://maptiler.download/desktop/${_pkgname}")
source=("https://maptiler.download/engine/maptiler-engine-${pkgver}-app-linux.deb")
md5sums=('f01f625238fab620d1eb2c01c7635f13')

package() {
  dpkg -x "${pkgname}-${pkgver}.deb" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

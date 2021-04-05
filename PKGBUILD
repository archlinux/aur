# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler
pkgver=11.1
pkgrel=1
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'libwebp')
options=(!strip)
makedepends=('dpkg')
replaces=('maptiler-64bit')
install=maptiler.install
_pkgname="${pkgname}-desktop-${pkgver}-free-linux.deb"
source=("https://maptiler.download/desktop/${_pkgname}")
md5sums=('206940e3df5325aecc42cfa7acc0f744')

package() {
  dpkg -x "${_pkgname}" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler64bit
pkgver=10.0
pkgrel=2
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'libwebp')
makedepends=('dpkg')
_pkgname="${pkgname%64bit}-${pkgver}-free-linux.debian-testing.amd64.deb"
source=("http://downloads.klokantech.com/maptiler/${_pkgname}")
md5sums=('31c6a3f474ad9687385c37366b6755a6')

package() {
  dpkg -x "${_pkgname}" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

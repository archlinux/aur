# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler
pkgver=10.1
pkgrel=1
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'libwebp')
makedepends=('dpkg')
replaces=('maptiler-64bit')
install=maptiler.install
_pkgname="${pkgname%64bit}-desktop-${pkgver}-free-linux.debian-testing.amd64.deb"
source=("http://downloads.klokantech.com/maptiler/${_pkgname}")
md5sums=('57469052cb19725087557b1972308fa4')

package() {
  dpkg -x "${_pkgname}" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

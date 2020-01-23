# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=maptiler
pkgver=10.3
pkgrel=1
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'libwebp')
makedepends=('dpkg')
replaces=('maptiler-64bit')
install=maptiler.install
# _pkgname="${pkgname%64bit}-desktop-${pkgver}-free-linux.debian-testing.amd64.deb"
_pkgname="${pkgname%64bit}-desktop-${pkgver}-free-linux.debian-10-buster.amd64.deb"
source=("http://downloads.klokantech.com/maptiler/${_pkgname}")
md5sums=('a7413a25f8b5cae0c75302c55dd3d17b')

package() {
  dpkg -x "${_pkgname}" "$pkgdir"
}

# vim:set ts=2 sw=2 et:

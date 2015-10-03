# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=maptiler64bit
pkgver=0.6.2
pkgrel=1
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal')
makedepends=('dpkg')
source=("http://downloads.klokantech.com/maptiler/${pkgname}-${pkgver}-free-linux.debian-jessie.amd64.deb")
md5sums=('41bb5e03f45051283490a3957f3f5dc6')

package() {
  dpkg -x ${pkgname}-${pkgver}-free-linux.debian-jessie.amd64.deb "$pkgdir"
}

# vim:set ts=2 sw=2 et:

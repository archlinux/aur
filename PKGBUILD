# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=maptiler32bit
pkgver=1.0.beta2
pkgrel=2
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('i686')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal')
makedepends=('dpkg')
source=(https://dl.dropboxusercontent.com/u/29095940/oss/maptiler.tgz)
md5sums=('a8c61c539c4d280424d9044bcd7c52ef')

package() {
  #dpkg -x ${pkgname}_${pkgver}_all.deb "$pkgdir"
  #grep -rl '^#!/usr/bin/env python$' $pkgdir | xargs sed -i 's/^\#\!\/usr\/bin\/env\ python$/\#\!\/usr\/bin\/env\ python2/g'
  cd $srcdir
  cp -r . $pkgdir
  rm $pkgdir/maptiler.tgz
}

# vim:set ts=2 sw=2 et:

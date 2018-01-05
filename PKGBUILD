# $Id: PKGBUILD 261267 2017-10-02 15:52:43Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2017.3.1
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=(any)
license=('GPL')
url="http://www.flightgear.org/"
options=(!strip)
source=("http://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/FlightGear-${pkgver}-data.tar.bz2")
sha256sums=('df08b06e88a29a9f80f29186afd54d278636a663281a1b68e8f484bbb403d898')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv fgdata/ "$pkgdir"/usr/share/flightgear/data
  chown root:root "$pkgdir"/usr/share/flightgear/data
}

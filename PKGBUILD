# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2018.1.1
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=(any)
license=('GPL')
url="http://www.flightgear.org/"
options=(!strip)
source=("http://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/FlightGear-${pkgver}-data.tar.bz2")
sha256sums=('dfd80e09f6bf04bd25604788c080716007969d127d46d0e10c43c2f709fb8db8')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv fgdata/ "$pkgdir"/usr/share/flightgear/data
  chown root:root "$pkgdir"/usr/share/flightgear/data
}

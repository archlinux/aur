# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2020.3.12
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('any')
license=('GPL')
url="http://www.flightgear.org/"
options=(!strip)
source=("https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/FlightGear-${pkgver}-data.txz")
sha256sums=('802b16f5ef08b97c2625f01fc49fe73911795bf3f00a46be3bc0a1c26dba3a76')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv fgdata/ "$pkgdir"/usr/share/flightgear/data
  chown root:root "$pkgdir"/usr/share/flightgear/data
}

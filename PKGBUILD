# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2020.3.2
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('any')
license=('GPL')
url="http://www.flightgear.org/"
options=(!strip)
source=("https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/FlightGear-${pkgver}-data.tar.bz2")
sha256sums=('58b3198f7c60896f7abb36d532593c5e9aaba3de36a38fd4b98035d6a20df92e')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv fgdata/ "$pkgdir"/usr/share/flightgear/data
  chown root:root "$pkgdir"/usr/share/flightgear/data
}

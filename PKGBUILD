# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=lstv
pkgver=1.0.1
pkgrel=1
pkgdesc="DVB channel selector for mplayer."
arch=(any)
depends=(mplayer)
#source=("https://downloads.sourceforge.net/project/lstv/lstv-0.0.1.tar.gz?r=&ts=1411909125&use_mirror=optimate")
source=("https://github.com/AndyCrowd/lstv/blob/master/lstv")
optdepends=(w_scan)
license=('GPL')
md5sums=(SKIP)
url="https://github.com/AndyCrowd/lstv/blob/master/lstv"

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/lstv" "$pkgdir/usr/bin"
}

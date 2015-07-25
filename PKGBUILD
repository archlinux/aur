# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=lstv
pkgver=0.0.1
pkgrel=1
pkgdesc="DVB channel selector for mplayer."
arch=(any)
depends=(mplayer)
#source=("https://downloads.sourceforge.net/project/lstv/lstv-0.0.1.tar.gz?r=&ts=1411909125&use_mirror=optimate")
source=("http://garr.dl.sourceforge.net/project/lstv/lstv-0.0.1.tar.gz")
optdepends=(w_scan)
license=('GPL')
md5sums=("5ad21d52ee7a03773136921563ef3738")
url=("https://sourceforge.net/projects/lstv/")

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname-$pkgver/lstv" "$pkgdir/usr/bin"
}














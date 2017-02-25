# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=gpstk-bin
pkgver=2.8
pkgrel=1

pkgdesc="Algorithms and frameworks supporting the development of processing and analysis applications in navigation and global positioning."
url="http://www.gpstk.org"
license=('LGPL')
depends=()
makedepends=()
optdepends=()
provides=('gpstk')
conflicts=('gpstk')
arch=('x86_64')
source=(https://github.com/SGL-UT/GPSTk/releases/download/v${pkgver}/GPSTK-${pkgver}.0-Debian.tar.gz)
md5sums=('60a5d11b748707e90d58a3ce6b1226f5')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr

  cp -r $srcdir/bin $pkgdir/usr
  cp -r $srcdir/include $pkgdir/usr
  cp -r $srcdir/lib $pkgdir/usr
  cp -r $srcdir/share $pkgdir/usr
}

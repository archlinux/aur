# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=gpstk-bin
pkgver=2.5
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
source=(http://softlayer-dal.dl.sourceforge.net/project/gpstk/gpstk/${pkgver}/gpstk-${pkgver}.linux.x86_64.tar.gz)
md5sums=('083706d792aaaf3d84ba85ff841f7f54')

package() {
  cd $srcdir/gpstk-${pkgver}.linux.$CARCH
  mkdir -p $pkgdir/usr

  cp -r $srcdir/gpstk-${pkgver}.linux.$CARCH/bin $pkgdir/usr
  cp -r $srcdir/gpstk-${pkgver}.linux.$CARCH/include $pkgdir/usr
  cp -r $srcdir/gpstk-${pkgver}.linux.$CARCH/lib $pkgdir/usr
}

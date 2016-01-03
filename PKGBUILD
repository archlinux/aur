# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=xnap
pkgver=2.5r3
pkgrel=1
pkgdesc="OpenNap Client."
arch=('i686' 'x86_64')
url="http://xnap.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/xnap/XNap/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('51362d73c5802cef6b981ea95b3225fc')

package() {
  cd $startdir

# Desktop icon
  install -Dm644 xnap.png $pkgdir/usr/share/pixmaps/xnap.png
  install -Dm644 xnap.desktop $pkgdir/usr/share/applications/xnap.desktop

  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 $pkgname.jar $pkgdir/usr/bin/$pkgname.jar
}

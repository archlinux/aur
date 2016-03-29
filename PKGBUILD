# Author : Esclapion <esclapion at gmail dot com>

pkgname=ambiance-graphite
pkgver=1.3
pkgrel=0
pkgdesc="Theme radiance graphite adapted for LXQt"
url="http://www.ravefinity.com/p/ambiance-radiance-colors-suite.html"
license=(GPL)
arch=(any)
source=("http://esclapion.free.fr/AUR/$pkgname-$pkgver.tar.gz")
conflicts=("ambiance-radiance-colors-suite")
md5sums=('5d69aa7c456e17a72e507b43d933266d')

package(){
  mkdir -p $pkgdir/usr/share/themes
  cp -a $srcdir/AmbianceGraphite $pkgdir/usr/share/themes
}

# Maintainer: Romanos Skiadas <rom skiad at gmail dot com>

pkgname=ttf-whiterabbit
pkgver=1.0
source=('whitrabt.ttf')
sha1sums=('69703ad9d651dd4ca30e1644662cdadd7f02e5b2')
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="White Rabbit font"
arch=('any')
install=$pkgname.install
license=('GPL')
url='http://www.squaregear.net/fonts/whitrabt.shtml'

package()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/../whitrabt.ttf $pkgdir/usr/share/fonts/TTF
}

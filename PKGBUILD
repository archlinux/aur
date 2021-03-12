# Maintainer: Romanos Skiadas <rom skiad at gmail dot com>

pkgname=ttf-whiterabbit
pkgver=1.0
pkgrel=3
pkgdesc="White Rabbit font"
arch=('any')
license=('GPL')
url='https://www.squaregear.net/fonts/whitrabt.html'
source=(https://squaregear.net/fonts/whitrabt.zip)
md5sums=('5c8786a00321748795ade1ad8bb659be')

package()
{
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install *.ttf ${pkgdir}/usr/share/fonts/TTF
}

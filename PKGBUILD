# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: masutu <masutu dot arch at gmail dot com>
# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=tnote
pkgver=0.2.1
pkgrel=2
pkgdesc="A small note taking program for the terminal"
arch=(any)
url="http://sourceforge.net/projects/tnote/"
license=('GPL3')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('17b43996a7889c6f84cd2072c485c1a4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:

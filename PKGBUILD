# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=samuel
pkgver=0.1.8
pkgrel=3
pkgdesc="An open source Draughts Game for Linux"
arch=('any')
url="http://johncheetham.com/projects/samuel/"
license=('GPL3')
depends=('pygtk')
source=(http://www.johncheetham.com/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0f92b075dab84ba1922f76da9da58d01')

package() {
   cd $srcdir/$pkgname-$pkgver

   python2 setup.py install --root $pkgdir
}

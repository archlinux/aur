# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-turtleart
_realname=TurtleArt
pkgver=170
pkgrel=1
pkgdesc="Sugar turtle art"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('ff5c5d1ae1ee17367545a65d247c472a')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


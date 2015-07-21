# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-getthingsdone
_realname=GetThingsDone
pkgver=1
pkgrel=1
pkgdesc="Sugar get things done"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('21b11502282a4732bf20a473564ea79f')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


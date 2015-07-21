# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-calculate
_realname=Calculate
pkgver=43
pkgrel=1
pkgdesc="Sugar calculator"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('3b7f46f3ce9da2a4e8d40498ba0e9298')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


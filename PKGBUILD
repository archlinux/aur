# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-log
_realname=Log
pkgver=37
pkgrel=1
pkgdesc="Sugar log viewer"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('8ef6eaecdfb151395ee7a6e9dbe9a9e4')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


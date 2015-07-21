# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-read
_realname=Read
pkgver=116
pkgrel=1
pkgdesc="Sugar book reader"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('bad023b3ebe8049fba3b4ef611a5a919')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


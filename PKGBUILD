# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-clock
_realname=Clock
pkgver=1
pkgrel=1
pkgdesc="Sugar clock"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('69b222bd64cf59fcdc144d504fe87319')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-browse
_realname=Browse
pkgver=157.2
pkgrel=1
pkgdesc="Sugar internet browser."
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar' 'python2-dateutil')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('53c07ffc60606112c3fd1543693eeb12')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

# vim:set ts=2 sw=2 et:

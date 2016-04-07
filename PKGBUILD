# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=keymanager
pkgname=python2-leap_$_srcname
pkgver=0.4.3
pkgrel=1
pkgdesc='Python nicknym agent.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-gnupg'
  'python2-simplejson'
  'python2-requests'
  'python2-leap_pycommon')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('c9a2d348a5382510cad4069f57480d62132e33c934cf7c7337339c8d6fe15350')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

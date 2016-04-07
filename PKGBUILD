# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_mail
pkgname=python2-$_srcname
pkgver=0.4.0
pkgrel=1
pkgdesc='The magick sauce for leap encrypted email!'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-zope-interface'
  'python2-twisted'
  'python2-zope-proxy'
  'python2-service-identity'
  'python2-leap_pycommon'
  'python2-leap_soledad_client'
  'python2-leap_keymanager')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('d3ba7cb72a0afefa755ed45f41086af4a07e12ddceea1f342ac58262cb68dacd')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

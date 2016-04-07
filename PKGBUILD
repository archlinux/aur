# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

_srcname=leap_pycommon
pkgname=python2-$_srcname
pkgver=0.5.0
pkgrel=1
pkgdesc='Common utilities for leap python modules.'
arch=('any')
url='https://bitmask.net/'
license=('GPL3')
depends=(
  'python2-jsonschema'
  'python2-pyopenssl'
  'python2-dateutil'
  'python2-pyzmq'
  'python2-txzmq'
  'python2-dirspec')
source=("https://github.com/leapcode/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('a42371c0ac5fcd5fad402d5c54b03e9c526adec7efc512710f8cff90665da0a3')

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

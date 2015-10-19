# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgname="python2-pymodbus"
pkgver=1.2.0
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pymodbus"
license=('BSD')
pkgdesc="A fully featured modbus protocol stack in python"
depends=('python2')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pymodbus/pymodbus-$pkgver.tar.gz")
md5sums=("90f9b63cf962b3032dc60ad81a185f34")

package() {
  cd "$srcdir/pymodbus-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=python2-pynmea
pkgver=0.6.0
pkgrel=1
pkgdesc="Python NMEA Library - a small library to help read and parse NMEA data"
arch=(any)
url="http://pypi.python.org/pypi/pynmea/0.6.0"
license=('MIT')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/p/pynmea/pynmea-${pkgver}.tar.gz")
md5sums=('69bfc63f475bdeb34bf8aa0745236672')

package() {
  cd "$srcdir/pynmea-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

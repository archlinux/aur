# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.5
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil')
makedepends=('python-setuptools')

source=("https://github.com/C4ptainCrunch/ics.py/archive/v${pkgver}.tar.gz")
sha512sums=('27fc2660cb069d003e6053587a32c54895ff4e1878145274cf88142b36ec47e88b73b1c1835da2b0ebdd945fefd24ceceff8efda11905edaf94de9bd95bdb91a')

package() {
  cd "ics.py-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

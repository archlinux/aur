# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.7
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil' 'python-tatsu')
makedepends=('python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/C4ptainCrunch/ics.py/archive/v${pkgver}.tar.gz")
sha512sums=('7bdb168dd12e10fff257086923f2c15475db0cdab95da2ccb9a4d6cb33d469901c6bbbc9bdad232f981f45eeacad17c76349c9db190d2a8a5d160500d5352b47')

package() {
  cd "ics.py-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

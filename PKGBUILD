# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.6
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil' 'python-tatsu')
makedepends=('python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/C4ptainCrunch/ics.py/archive/v${pkgver}.tar.gz")
sha512sums=('a6b23bba9e47d52c22b789965ffb1fcc2ae2905afd2e50ffeff5f7f25e38dd75444a5aa30c90b60b74b596b7f71ad26bd0eb52893fc2bbb9f6e4b0241be936de')

package() {
  cd "ics.py-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

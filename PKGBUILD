# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.7
pkgrel=2
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil' 'python-tatsu')
makedepends=('python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ics-py/ics-py/archive/v${pkgver}.tar.gz")
sha512sums=('b74e04f7dff6f29877e3250117cccd7ae7ca923e2f0332177e0dd4a13d7e0d079342829d5a035a7d00946d4416d3d15e94e1d468ce241bb35cddd33ba2940716')

package() {
  cd "ics-py-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

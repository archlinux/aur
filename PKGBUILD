# Maintainer: Yngve Levinsen <yngve AT levinsen DOT gmail>
# Contributor: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname=python-ics
pkgver=0.7.2
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python' 'python-arrow' 'python-dateutil' 'python-tatsu' 'python-requests' 'python-attrs')
makedepends=('python-setuptools')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ics-py/ics-py/archive/v${pkgver}.tar.gz")
sha512sums=('3c0c0569f8653e64041c809d991e0e41e0372d8c8368d54b6babd5c243e8b8014b505609c4ded832cb0402a347850de573312134bc60639a21e0bab70c10152d')

package() {
  cd "ics-py-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

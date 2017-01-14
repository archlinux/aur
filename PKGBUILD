# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname='python2-flask-table'
pkgver='0.3.0'
pkgrel='1'
pkgdesc='HTML tables for use with the Flask micro-framework'
arch=('x86_64' 'i686')
url='http://pypi.python.org/pypi/Flask-Table/'
license=('BSD')
depends=('python2-flask' 'python2-babel')
makedepends=('python2-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/plumdog/flask_table/archive/v$pkgver.tar.gz")
sha1sums=('812f75a5e14ff54dd4bed8a50889e715aaa36837')

build() {
  cd "flask_table-${pkgver}"
  python2 setup.py build
}

package() {
  cd "flask_table-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:

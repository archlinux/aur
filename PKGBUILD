# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname='python2-flask-table'
pkgver='0.2.12'
pkgrel='1'
pkgdesc='HTML tables for use with the Flask micro-framework'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Table/'
license=('BSD')
depends=('python2-flask' 'python2-babel')
makedepends=('python2-setuptools')

source=("https://pypi.python.org/packages/f4/70/48b55d81062807f1c758e1a69fff1365f888ba09a2f221c870f82da2621b/Flask-Table-0.2.12.tar.gz")
sha1sums=('6ba1017fccdda1a02933b7e256a9353e0c80dece')

build() {
  cd "Flask-Table-${pkgver}"
  python2 setup.py build
}

package() {
  cd "Flask-Table-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:

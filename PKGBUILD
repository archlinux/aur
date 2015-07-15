# Contributor: Chris McDonough
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=python-waitress
pkgver=0.8.9
pkgrel=1
pkgdesc="Waitress WSGI server"
arch=(any)
url="https://github.com/Pylons/waitress"
license=('ZPL')
depends=('python')

source=(http://pypi.python.org/packages/source/w/waitress/waitress-${pkgver}.tar.gz)
md5sums=('da3f2e62b3676be5dd630703a68e2a04')

build() {
  cd "${srcdir}/waitress-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

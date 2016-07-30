# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname='python-suds'
pkgver='1.3.2'
pkgrel='1'
pkgdesc="A lightweight SOAP python client (suds-py3) - suds for python3"
arch=('any')
url='https://github.com/cackharot/suds-py3'
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/1d/d3/679a94faca901ff038492281e7feb0da4d5f7a6a3fe436089f5426596a92/suds-py3-${pkgver}.0.tar.gz")
md5sums=('8ec3a40f2f478082bfeb139853130983')

package() {
  cd "${srcdir}/suds-py3-${pkgver}.0"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et

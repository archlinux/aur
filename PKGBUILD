# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>
_pkgname=storm
pkgname=python-storm
pkgver=0.21
pkgrel=1
pkgdesc="An object-relational mapper (ORM) for Python"
arch=('any')
url="https://storm.canonical.com"
license=('LGPL')
depends=('python' 'python-six')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('26f8179daed04d062ebba1fbb0c7e797')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

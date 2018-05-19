# Maintainer: renek <aur@spaceshore.net>
_pkgname=orderedset
pkgname=python-${_pkgname}
pkgver=2.0.1
pkgrel=1
pkgdesc="An ordered set implementation in cython"
arch=('any')
url='https://pypi.python.org/pypi/orderedset/'
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('481f3073b2c571ca211aa77601b577c2983677dae4b1c7d58889c302889bc0f90b7b84020d7f61c774c4f6c409c6c732826565e88d695515ab431e730cbcaba2')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

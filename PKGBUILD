# Maintainer: renek <aur@spaceshore.net>
_pkgname=orderedset
pkgname=python-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="An ordered set implementation in cython"
arch=('any')
url='https://pypi.python.org/pypi/orderedset/'
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1ad2abdd4a0fa7ae9c915ae7beb6f96a30280cf6a9bf39eed32a9109af53a464791111c96037ea37f2cef839b48410acc1098b475e8afa5de8b405ce3da06b61')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

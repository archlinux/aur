# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=pyszn
pkgname=python-pyszn
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python package for the Simplified Zone Notation standard"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-pyparsing')
makedepends=('python-setuptools')
source=("https://github.com/HPENetworking/${_pythonmod}/archive/${pkgver}.tar.gz")
sha256sums=('784f881c6961de0b3ec1a89fb1d2640cd9cdc3bd15bc96342625b57dddb8e71b')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=pyszn
pkgname=python-pyszn
pkgver=1.3.0
pkgrel=1
pkgdesc="A Python package for the Simplified Zone Notation standard"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-pyparsing')
makedepends=('python-setuptools')
source=("https://github.com/HPENetworking/${_pythonmod}/archive/${pkgver}.tar.gz")
sha256sums=('71b437e0ab1110d947587cf77bbcee636eb36a1569300ee97aeaaa8ff3ef5bf3')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=autoapi
pkgname=python-autoapi
pkgver=2.0.0
pkgrel=1
pkgdesc="Automatic Python API reference documentation generator for Sphinx, inspired by Doxygen"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('418907b9953a92b2e5732e04a09952369f7983fcbb3ba47f40e05f6bdd9c4154')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

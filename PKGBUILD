# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=webdev
pkgname=python-webdev
pkgver=1.1.0
pkgrel=1
pkgdesc="Small web server for development or sharing purposes. It allows to serve through HTTP any directory in your machine"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('fd1cbd17b648f04b866332d17860612b1f9a6c4af485d8d9afc5985a50cbd0fd')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

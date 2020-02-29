# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=sphinx-readable-theme
pkgname=python-sphinx-readable-theme
pkgver=1.3.0
pkgrel=1
pkgdesc="A clean and readable Sphinx theme with focus on autodoc – documentation from docstrings"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('f5fe65a2e112cb956b366df41e0fc894ff6b6f0e4a4814fcbff692566db47fc0')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

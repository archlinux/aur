# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=pygments-github-lexers
pkgname=python-pygments-github-lexers
pkgver=0.0.5
pkgrel=1
pkgdesc="This entrypoint is used for adding Github Custom Lexers to the Pygments core"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-pygments')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('aaca57e77cd6fcfce8d6ee97a998962eebf7fbb810519a8ebde427c62823e133')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

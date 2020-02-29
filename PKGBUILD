# Maintainer: Javier Vasquez <je-vv@e.email>
_pythonmod=plantweb
pkgname=python-plantweb
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line interface to render powerful plain text UML diagrams, ASCII diagrams and complex graphs"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-six' 'python-requests' 'python-docutils')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha256sums=('148e5b7eaac464d76adcbdb98dcc192ef824d721b16ce82b2fcb1e84e17ae3db')

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

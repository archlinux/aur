# Maintainer:  Windel Bouwman <windel at windel dot nl>
# Contributor: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=python-pyqtgraph
_pkgname=pyqtgraph
pkgver=0.9.10
pkgrel=1
pkgdesc="Scientific Graphics and GUI Library for Python"
arch=('i686' 'x86_64')
license='MIT'
url="http://www.pyqtgraph.org/"
depends=('python' 'python-pyqt4' 'python-numpy')
optdepends=('python-opengl')
source=("http://www.pyqtgraph.org/downloads/pyqtgraph-${pkgver}.tar.gz")
md5sums=('6e2efa185b6b9227dfe16fefd921a8ec')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

# Maintainer:  Windel Bouwman <windel at windel dot nl>
# Contributor: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=python-pyqtgraph
_pkgname=pyqtgraph
pkgver=0.10.0
pkgrel=1
pkgdesc="Scientific Graphics and GUI Library for Python"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.pyqtgraph.org/"
depends=('python' 'python-pyqt4' 'python-numpy')
optdepends=('python-opengl')
# source=("http://www.pyqtgraph.org/downloads/0.10.0/pyqtgraph-${pkgver}.tar.gz")
source=("https://github.com/pyqtgraph/pyqtgraph/archive/pyqtgraph-${pkgver}.tar.gz")
md5sums=('d97a5681687b9cbbf2ad9674192eb5a6')

package() {
  cd "$srcdir/pyqtgraph-$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

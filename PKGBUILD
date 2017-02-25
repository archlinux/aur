# Maintainer:  Windel Bouwman <windel at windel dot nl>
# Contributor: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=python2-pyqtgraph
_pkgname=pyqtgraph
pkgver=0.10.0
pkgrel=1
pkgdesc="Scientific Graphics and GUI Library for Python"
arch=('any')
license=('MIT')
url="http://www.pyqtgraph.org/"
depends=('python2' 'python2-pyqt4' 'python2-numpy')
optdepends=('python2-opengl')
source=("http://www.pyqtgraph.org/downloads/${pkgver}/pyqtgraph-${pkgver}.tar.gz")
md5sums=('3f191f724a3f9d829094af6237f1db5a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/tv_viewer
pkgname=tv_viewer
pkgver=1.1
pkgrel=3
pkgdesc="GUI to view television show details using TV maze API. Python3 Pyqt5 SQLite"
arch=('any')
url="https://github.com/gavinlyonsrepo/tv_viewer"
license=('GPL')
depends=('python' 'python-prettytable' 'python-pyqt5' 'python-pytvmaze')
makedepends=('python-setuptools')
source=("https://github.com/gavinlyonsrepo/tv_viewer/archive/$pkgver.tar.gz")

md5sums=('37c7fa915c232d605ada57f1968a13c4')

package() {
    cd "$srcdir/tv_viewer-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

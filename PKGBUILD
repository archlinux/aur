# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/tv_viewer
pkgname=tv_viewer
pkgver=1.2
pkgrel=4
pkgdesc="GUI to view television show details using TV maze API. Python3 Pyqt5 SQLite"
arch=('any')
url="https://github.com/gavinlyonsrepo/tv_viewer"
license=('GPL')
depends=('python' 'python-prettytable' 'python-pyqt5' 'python-pytvmaze')
makedepends=('python-setuptools')
source=("https://github.com/gavinlyonsrepo/tv_viewer/archive/$pkgver.tar.gz")

sha256sums=('5dd14a4d1439f311fba87b800132aba1de9c5463a180dcc01ed45f2d31ee9afd')

package() {
    cd "$srcdir/tv_viewer-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

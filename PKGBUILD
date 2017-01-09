# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
pkgver=3.2.4
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/ec/49/ae3aa7b374b0832ade3837b8de8b7d71212c14d12520c1b3d2279430ab8b/xdis-${pkgver}.tar.gz")
sha256sums=('b311253b97a321ab45625089a729ccbf8bcb1319a8c4c0167b719f81c081543c')

build() {
    cd "$srcdir/xdis-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/xdis-${pkgver}"
    python setup.py install --root="$pkgdir"
}

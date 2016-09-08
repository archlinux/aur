# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
pkgver=2.2.3
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/db/f9/8fd281e536e67cc19f6ec979bf56bb60c6515ba0f0504c6390685d522124/xdis-${pkgver}.tar.gz")
sha256sums=('42f53171d9a03a056f260613d69dd0eae4b7f1f7a25dbee4e0a7432f9dec5c57')

build() {
    cd "$srcdir/xdis-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/xdis-${pkgver}"
    python setup.py install --root="$pkgdir"
}

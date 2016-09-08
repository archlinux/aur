# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.8.2
pkgrel=2
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.4.0' 'python-xdis>=2.2.3')
source=("https://pypi.python.org/packages/ce/ce/186078fad64990b7ceefc7f144eace02363ff46d7fb45ad8ac23be7a3463/uncompyle6-${pkgver}.tar.gz")
sha256sums=('f42de9f551e5680cd411d146a0dafca2971ed546691015f147f790816718090a')

build() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py install --root="$pkgdir"
}

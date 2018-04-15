# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=3.1.2
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python-spark-parser>=1.8.5' 'python-spark-parser<1.9.0' 'python-xdis>=3.8.0' 'python-xdis<3.9.0' 'python-six')
source=('git+https://github.com/rocky/python-uncompyle6.git#commit=ab414d3d9c30828c9afe89b24a841f7467c41b17')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

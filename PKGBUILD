# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.13.2
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.7.0' 'python-spark-parser<1.8.0' 'python-xdis>=3.6.0' 'python-xdis<3.7.0' 'python-six')
source=('git://github.com/rocky/python-uncompyle6.git#commit=3f309cebab5222a82a9cea4c5c6824c6dbc3384f')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

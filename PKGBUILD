# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.14.1
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.8.4' 'python-spark-parser<1.9.0' 'python-xdis>=3.6.2' 'python-xdis<3.7.0' 'python-six')
source=('git://github.com/rocky/python-uncompyle6.git#commit=3ac1e64c56bdaba9cea33f8862b792ec1d005ec5')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

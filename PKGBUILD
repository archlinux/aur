# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.9.11
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.6.1' 'python-spark-parser<1.7.0' 'python-xdis>=3.5.4' 'python-xdis<3.6.0' 'python-six')
source=('git://github.com/rocky/python-uncompyle6.git#commit=c54a47b15f85be50d2278aa79fd514eb08580e65')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

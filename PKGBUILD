# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.8.5
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
depends=('python-click')
source=(python-spark-parser::'git://github.com/rocky/python-spark.git#commit=9b7079f7bfdfe2c16f25f7807f04dd8d8a0f8348')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

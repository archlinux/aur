# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.6.1
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
depends=('python-click')
source=(python-spark-parser::'git://github.com/rocky/python-spark.git#commit=9da5c8b7e9bd2bf6dce4bb0a8bd6875498153c32')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

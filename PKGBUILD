# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.7.0
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
depends=('python-click')
source=(python-spark-parser::'git://github.com/rocky/python-spark.git#commit=aa8cf5c448972692bd594e9428df66e6731644b0')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}

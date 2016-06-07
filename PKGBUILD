# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.2.1
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/8e/07/1d809c7fb75dc9b28a5a3127582c4ccb65989466d8b9644c73702bc1b237/spark_parser-${pkgver}.tar.gz")
sha256sums=('9e706bf5e1965a9ab902667c5f9335f3711838adc906d4a585065c23e8ed9a83')

build() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py install --root="$pkgdir"
}


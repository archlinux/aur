# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.5.1
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/c6/dc/6d7e50a390ef3677d064eea7506669cb1a14fb0a389accd6d66901bc8e7e/spark_parser-${pkgver}.tar.gz")
sha256sums=('b6753103f3744deefde7f841c275e4d15d813059a5b575ca7df28fa45480f83a')

build() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py install --root="$pkgdir"
}


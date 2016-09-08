# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-spark-parser
pkgver=1.4.0
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python')
source=("https://pypi.python.org/packages/74/7b/367b1f0fad193175b1a71a5cb8d6866e3888fcb2950dc4027a9f683a7492/spark_parser-${pkgver}.tar.gz")
sha256sums=('282fe0d19de48d5fda6148032e47c822e2f088a5ff050cb7544f2bc2e701ede4')

build() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/spark_parser-${pkgver}"
    python setup.py install --root="$pkgdir"
}


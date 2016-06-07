# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-uncompyle6
pkgver=2.4.0
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python')
depends=('python-spark-parser>=1.2.1')
source=("https://pypi.python.org/packages/85/85/c266830c16aa339869dd3b9c09c158b20295b0ac11126af9720bf9f18cac/uncompyle6-${pkgver}.tar.gz")
sha256sums=('3ea9877d880ea28f678524a5f846a7f8c09ad32681bcede8de3755ddf8bc1c3e')

build() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/uncompyle6-${pkgver}"
    python setup.py install --root="$pkgdir"
}

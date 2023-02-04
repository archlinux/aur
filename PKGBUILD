# Maintainer: Parth Nobel <parthnobel AT gmail DOT com>

pkgname=("python-auto_diff")
pkgdesc="An automatic differentiation library for Python+NumPy."
pkgver="0.4.1"
pkgrel=1
url="https://github.com/PTNobel/AutoDiff"
license=('BSD')
arch=('any')
source=("https://github.com/PTNobel/AutoDiff/archive/v${pkgver}.tar.gz")
sha256sums=('9431c0ffc7a5b7072abcbeb5de0d556c33fd1afda93054fa878cfbb0a528e4e8')
build() {
    cd "AutoDiff-$pkgver"
    python setup.py build
}

package(){
    cd "AutoDiff-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

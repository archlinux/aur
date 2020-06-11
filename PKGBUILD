# Maintainer: Parth Nobel <parthnobel AT gmail DOT com>

pkgname=("python-auto_diff")
pkgdesc="An automatic differentiation library for Python+NumPy."
pkgver="0.4.0"
pkgrel=1
url="https://github.com/PTNobel/AutoDiff"
license=('BSD')
arch=('any')
source=("https://github.com/PTNobel/AutoDiff/archive/v${pkgver}.tar.gz")
sha256sums=('5e82eb39b5663a5efcc8ad9ebe12e6dd2c4e128bc6f90bbf083198d6147f0e4f')
build() {
    cd "AutoDiff-$pkgver"
    python setup.py build
}

package(){
    cd "AutoDiff-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

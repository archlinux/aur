# Maintainer: Parth Nobel <parthnobel AT gmail DOT com>

pkgname=("python-auto_diff")
pkgdesc="An automatic differentiation library for Python+NumPy."
pkgver="0.3.3"
pkgrel=1
url="https://github.com/PTNobel/AutoDiff"
license=('BSD')
arch=('any')
source=("https://github.com/PTNobel/AutoDiff/archive/v${pkgver}.tar.gz")
sha256sums=('dc44a08a55957b3fa20538ec47f2bf05ea41c40e47118162ef3e90c82ce9aae2')
build() {
    cd "AutoDiff-$pkgver"
    python setup.py build
}

package(){
    cd "AutoDiff-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: Parth Nobel <parthnobel AT gmail DOT com>

pkgname=("python-auto_diff")
pkgdesc="An automatic differentiation library for Python+NumPy."
pkgver="0.3.1"
pkgrel=1
url="https://github.com/PTNobel/AutoDiff"
license=('BSD')
arch=('any')
source=("https://github.com/PTNobel/AutoDiff/archive/v${pkgver}.tar.gz")
sha256sums=('d4498226411f013692d21e449823f1c61f600bb4d7f4ce8e603f575a71ed8dc9')
build() {
    cd "AutoDiff-$pkgver"
    python setup.py build
}

package(){
    cd "AutoDiff-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# Python package author: Pablo Lecolinet <pablolec@pm.me>
pkgname=python-recoverpy
_pkgname="recoverpy"
pkgver=1.1.1
pkgrel=1
pkgdesc="A console user interface to recover overwritten or deleted text data."
arch=(any)
url="https://github.com/pablolec/recoverpy"
license=(GNU GPLv3)
makedepends=("python" "python-setuptools" )
source=($pkgname-$pkgver.tar.gz::https://github.com/PabloLec/recoverpy/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('1ccff07e3a4e17f6fdaee1aac83a53f0f024848741ef7b6993f0b83e6bba536e')
package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}

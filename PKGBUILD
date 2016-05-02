# Maintainer: Colin Duquesnoy <colin[dot]duquesnoy[at]gmail[dot]com>
pkgname=opencobolide
pkgver=4.7.3
pkgrel=1
pkgdesc="A simple and lightweight COBOL IDE based on the GnuCOBOL compiler."
arch=("any")
url="https://github.com/OpenCobolIDE/OpenCobolIDE"
license=("GPL")
depends=("python" "python-pyqt5" "gnu-cobol")
makedepends=("python-setuptools")
source=("https://github.com/OpenCobolIDE/OpenCobolIDE/archive/${pkgver}.tar.gz")
md5sums=('897bd1d4d62c30de03bb3d66e7bb37b2')

package() {
  cd "$srcdir/OpenCobolIDE-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

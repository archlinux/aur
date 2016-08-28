# Maintainer: Colin Duquesnoy <colin[dot]duquesnoy[at]gmail[dot]com>
pkgname=opencobolide
pkgver=4.7.5
pkgrel=1
pkgdesc="A simple and lightweight COBOL IDE based on the GnuCOBOL compiler."
arch=("any")
url="https://github.com/OpenCobolIDE/OpenCobolIDE"
license=("GPL")
depends=("python" "python-pyqt5" "gnu-cobol")
makedepends=("python-setuptools")
source=("https://github.com/OpenCobolIDE/OpenCobolIDE/archive/${pkgver}.tar.gz")
md5sums=('95abb1245b8ec5338ef9c5a579c9144a')


package() {
  cd "$srcdir/OpenCobolIDE-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

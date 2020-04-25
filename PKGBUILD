# Maintainer: Charles Vejnar

pkgname=python-pyfaidx
pkgver=0.5.8
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("70ff94e7f044b25bad83ad8e40a5df0d5569c277")

build() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

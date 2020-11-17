# Maintainer: Charles Vejnar

pkgname=python-pyfaidx
pkgver=0.5.9.1
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("022060ddc59f996d47e1d2d206ea99ecabef32f2")

build() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

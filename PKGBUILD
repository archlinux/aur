# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-pyfaidx
pkgver=0.4.8.1
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("5229bff9d953c6ebdd22ad29c94b12bb74130a44")

build() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

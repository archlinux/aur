# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-pyfaidx
pkgver=0.4.1.1
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("c8b830f0004ff5984729c3c17dc588f437da66a2")

build() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

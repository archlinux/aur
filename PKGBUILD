# Maintainer: Charles Vejnar

pkgname=python-pyfaidx
pkgver=0.5.5.2
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha1sums=("0760b1225e6777ab510c0b5b89ff416e7a73e94b")

build() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfaidx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

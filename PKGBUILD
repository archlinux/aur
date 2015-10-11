# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-momoko
pkgver=2.2.0
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=("any")
url="http://momoko.61924.nl"
license=("MIT")
depends=("python" "python-tornado" "python-psycopg2")
makedepends=("python-setuptools")
source=("http://pypi.python.org/packages/source/M/Momoko/Momoko-$pkgver.tar.gz")
sha1sums=("4bdbad5db652bd05858d0824b38424d3ef88fef2")

build() {
    cd $srcdir/Momoko-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/Momoko-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

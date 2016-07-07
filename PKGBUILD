# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-momoko
pkgver=2.2.3
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=("any")
url="http://momoko.61924.nl"
license=("MIT")
depends=("python" "python-tornado" "python-psycopg2")
makedepends=("python-setuptools")
source=("http://pypi.python.org/packages/source/M/Momoko/Momoko-$pkgver.tar.gz")
sha1sums=("1fb81c2d3565c8c1d0cf64ac77b2945ee8c9e468")

build() {
    cd $srcdir/Momoko-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/Momoko-$pkgver
    python setup.py install --root="$pkgdir"
}

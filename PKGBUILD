# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-momoko
pkgver=2.0.0
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=("any")
url="http://momoko.61924.nl"
license=("MIT")
depends=("python" "python-tornado" "python-psycopg2")
makedepends=("python-setuptools")
source=("http://pypi.python.org/packages/source/M/Momoko/Momoko-$pkgver.tar.gz")
sha1sums=("81b62104a6f5a3f3c7e9b922dae32f3cecbfb328")

build() {
    cd $srcdir/Momoko-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/Momoko-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

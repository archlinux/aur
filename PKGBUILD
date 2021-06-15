# Maintainer: Charles Vejnar

pkgname=python-pyfnutils
pkgver=1.1
pkgrel=1
pkgdesc="Small utility functions for Python."
arch=("any")
url="https://gitlab.com/vejnar/pyfnutils"
license=("MPLv2")
depends=("python")
makedepends=("python-setuptools")
source=("https://gitlab.com/vejnar/pyfnutils/-/archive/v$pkgver/pyfnutils-v$pkgver.tar.gz")
sha1sums=("366875df4b91f89f4786810102560ed27c94ff27")

build() {
    cd "$srcdir/pyfnutils-v$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyfnutils-v$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

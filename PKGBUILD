# Maintainer: Charles Vejnar

pkgname=python-fontools
pkgver=0.1
pkgrel=1
pkgdesc="FONtools: The Feature Object Notation tools"
arch=("any")
url="https://github.com/vejnar/fontools"
license=("MPLv2")
depends=("python" "python-pyfnutils" "python-pyfaidx")
makedepends=("python-setuptools")
source=("https://github.com/vejnar/fontools/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("d6e79e169f71d76165c1a2746ceb0312880919d6")

build() {
    cd "$srcdir/fontools-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/fontools-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

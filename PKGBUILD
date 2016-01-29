# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_pkg="ZConfig"

pkgname=python2-zconfig
pkgver=3.1.0
pkgrel=1
pkgdesc="Structured Configuration Library"
arch=(any)
url="https://pypi.python.org/pypi/ZConfig"
license=('GPL')
depends=('python2')
source=("http://pypi.python.org/packages/source/Z/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('096546fb13d22bce729bfe6d6419574b')

build() {
    cd "$srcdir/$_pkg-$pkgver"
    python2 setup.py build || return 1
    python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}


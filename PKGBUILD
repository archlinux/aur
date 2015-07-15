# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_pkg="ZConfig"

pkgname=python2-zconfig
pkgver=3.0.4
pkgrel=1
pkgdesc="Structured Configuration Library"
arch=(any)
url="https://pypi.python.org/pypi/ZConfig"
license=('GPL')
depends=('python2')
source=("http://pypi.python.org/packages/source/Z/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('32018f77d37f220b6a80aaf311fea63f')

build() {
    cd "$srcdir/$_pkg-$pkgver"
    python2 setup.py build || return 1
    python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}


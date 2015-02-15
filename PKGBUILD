# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-expiringdict
pkgver=1.1.3
pkgrel=1
_libname=expiringdict
pkgdesc='Dictionary with auto-expiring values for caching purposes'
url='https://pypi.python.org/pypi/expiringdict'
depends=('python2')
license=('Apache2')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('08bebdc5e008085e0612bd141d62f837c3f80b8c1880a95e0863100757b55b08')

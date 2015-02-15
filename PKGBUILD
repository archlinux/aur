# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-dnsq
pkgver=1.1.3
pkgrel=1
_libname=dnsq
pkgdesc='DNS Query Tool'
url='https://pypi.python.org/pypi/dnsq'
depends=('python2-expiringdict')
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

sha256sums=('c846c2e5d6e69be124fb14f7ccd3f64eba62df7421227afc5fdcfb221d1a1448')

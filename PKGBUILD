# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-expiringdict
pkgver=1.2.1
pkgrel=1
_libname=expiringdict
pkgdesc='Dictionary with auto-expiring values for caching purposes'
url='https://pypi.python.org/pypi/expiringdict'
depends=('python2')
license=('Apache2')
arch=('any')
source=(https://files.pythonhosted.org/packages/65/8d/f7187039bfbdaa693f55e45f62a189ddbc7b514e3c8687e3d3e4420f2862/expiringdict-${pkgver}.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('fe2ba427220425c3c8a3d29f6d2e2985bcee323f8bcd4021e68ebefbd90d8250')

# Maintainer: Oliver Sherouse <oliver@oliversherouse.com>

_pkgname=semver
pkgname=python-$_pkgname
pkgver=2.7.9
pkgrel=1
pkgdesc="Python helper for Semantic Versioning (http://semver.org/)"
arch=("any")
url="https://pypi.python.org/pypi/semver"
license=('BSD')
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/40/56/d1f930872436300b474a447a8042091bd335119f0c58bd8647546d6c3dc0/$_pkgname-$pkgver.tar.gz")
md5sums=("ef585f84629fd6fd5452bb30b35349c7")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: ft=sh

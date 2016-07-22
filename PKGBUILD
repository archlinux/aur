# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
pkgname=python-semver
pkgver=2.6.0
pkgrel=1
pkgdesc="Python helper for Semantic Versioning (http://semver.org/)"
arch=("any")
url="https://pypi.python.org/pypi/semver"
license=('BSD')
depends=("python")
makedepends=("python-setuptools")
source=("python-semver.tar.gz::https://pypi.python.org/packages/c6/47/54611c019d3fb1b31aee502c4893f56c4a329fb614f785c2af7f5846939a/semver-2.6.0.tar.gz")
md5sums=("a41da8cb8e8cdd56b281cec901c75a7b")


build() {
    cd "$srcdir/semver-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/semver-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: ft=sh

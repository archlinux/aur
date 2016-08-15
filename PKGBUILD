# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-gitpython
pkgver=2.0.8
pkgrel=1
pkgdesc="Python library used to interact with Git repositories"
arch=(any)
url="https://github.com/gitpython-developers/GitPython"
license=('BSD')
depends=('python-gitdb')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir"/GitPython-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/GitPython-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('adbc08a2244f5f00cd8d0dc7a115b55f269ca1677799393a86d499b6a4dd513e')

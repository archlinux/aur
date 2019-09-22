# Python package author: Steven Myint <UNKNOWN>
pkgname=python-autoflake
_pkgname=autoflake
pkgver=1.3.1
pkgrel=1
pkgdesc="Removes unused imports and unused variables"
arch=(any)
url="https://github.com/myint/autoflake"
license=("MIT")
depends=("python-pyflakes")
makedepends=("python")
source=("https://github.com/myint/autoflake/archive/v1.3.1.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('2cb19c3c27bd6ce8c8e8771c5b522abb')

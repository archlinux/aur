# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=htmlentities
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="HTML Entities for Python"
arch=('any')
url="https://github.com/cobrateam/python-htmlentities"
depends=('python')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b4ebe19044857c9313b63d27383ac2f1dfc1f006ee8821bc14b1c636ef949f59')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
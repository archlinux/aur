# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=stackprinter
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=1
pkgdesc="Debugging-friendly exceptions for Python"
arch=('i686' 'x86_64')
url="https://github.com/cknd/stackprinter"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

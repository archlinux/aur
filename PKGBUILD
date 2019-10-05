# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-cgen
_pkgname=cgen
pkgver=2019.1
pkgrel=1
pkgdesc="A C/C++ source generation from an AST"
arch=('any')
url="http://pypi.python.org/pypi/cgen"
license=('MIT')
depends=('python2')
source=("https://github.com/inducer/cgen/archive/v$pkgver.tar.gz")
md5sums=('aa75b560f74e65c93d7281e54518201b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

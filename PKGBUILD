# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-cgen
_pkgname=cgen
pkgver=2013.1.2
pkgrel=1
pkgdesc="A C/C++ source generation from an AST"
arch=('any')
url="https://pypi.python.org/pypi/cgen"
license=('MIT')
depends=('python2')
source=("http://pypi.python.org/packages/source/c/cgen/$_pkgname-$pkgver.tar.gz")
md5sums=('76fe441df17d5be4be90bfcfcc576a9f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

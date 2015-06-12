# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-la
pkgver=0.6.0
pkgrel=1
pkgdesc="Label the rows, columns, any dimension, of your NumPy arrays"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/la"
depends=('python2-bottleneck')
source=("https://pypi.python.org/packages/source/l/la/la-$pkgver.tar.gz")
md5sums=('94fe960d4d8bf1e92781990afb4e018d')

build() {
  cd "$srcdir/la-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/la-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

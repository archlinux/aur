# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-ioisis')
pkgver=0.1.1
pkgrel=1
pkgdesc="I/O tools for converting ISIS data in Python"
arch=('any')
url='https://github.com/scieloorg/ioisis'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-construct' 'python-jpype1' 'python-ujson')
options=(!emptydirs)
sha256sums=('04461824b70282ac55335288c0a1d0ea7047ecb12e43df90b9fde43c5abc578f')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/ioisis-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

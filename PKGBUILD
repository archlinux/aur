# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname=stellar
pkgver=0.4.3
pkgrel=1
pkgdesc="Stellar is a tool for creating and restoring database snapshots"
url="https://github.com/fastmonkeys/stellar"
depends=('python' 'python-yaml' 'python-sqlalchemy' 'python-humanize' 'python-psutil' 'python-click')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/s/stellar/stellar-0.4.3.tar.gz')
md5sums=('17fd85dbcf97f4c3b0fdd5ad7aca433b')

build() {
  cd "$srcdir/stellar-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/stellar-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

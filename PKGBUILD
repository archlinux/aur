# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname=stellar
pkgver=0.4.5
pkgrel=1
pkgdesc="Stellar is a tool for creating and restoring database snapshots"
url="https://github.com/fastmonkeys/stellar"
depends=('python' 'python-yaml' 'python-sqlalchemy' 'python-sqlalchemy-utils' 'python-humanize' 'python-psutil' 'python-click' 'python-schema' 'python-pytest')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/stellar/stellar-$pkgver.tar.gz")
md5sums=('2f6841e1ee739f88addf49c98638a017')

build() {
  cd "$srcdir/stellar-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/stellar-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

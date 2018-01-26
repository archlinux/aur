# Submitter: Michael Spradling <mike@mspradling.com>

_pkg="easypysmb"
pkgname="python-$_pkg"
pkgver=1.4.3
pkgrel=1
pkgdesc='Library wraps around the pysmb library'
arch=('any')
depends=('python-pysmb' 'python-pyasn1')
source=("https://github.com/pschmitt/$_pkg/archive/$pkgver.tar.gz")
md5sums=('c3c74647cc62c6cf216fc20d31554c90')

package() {
  cd "$srcdir/$_pkg-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=pypi-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="A command-line interface to the Python Package Index (PyPI)."
arch=('any')
url="https://github.com/sloria/pypi-cli"
license=('MIT')
depends=('python' 'python-requests' 'python-dateutil' 'python-click')
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e7d00f1178e4908f68d30ce8bd0135c3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

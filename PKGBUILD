# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=pypi-cli
pkgver=0.4.1
pkgrel=3
pkgdesc="A command-line interface to the Python Package Index (PyPI)."
arch=('any')
url="https://github.com/sloria/pypi-cli"
license=('MIT')
depends=('python' 'python-requests' 'python-dateutil' 'python-click')
source=("https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b2e91b019a60f7e01726778c92264819')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

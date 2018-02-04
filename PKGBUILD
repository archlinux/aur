# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=python-txdbus
_pkgname=txdbus
pkgver=1.1.0
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python' 'python-twisted')
source=("https://pypi.io/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('f17c9204c7f56365c297ba68e6840900')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

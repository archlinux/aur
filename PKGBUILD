# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-txdbus
_pkgname=txdbus
pkgver=1.0.13
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python2' 'twisted' )
source=("https://pypi.io/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('b862aae54740f8f8eb1ae193db6fa2d3')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

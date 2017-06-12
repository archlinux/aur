# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-txdbus
_pkgname=txdbus
pkgver=1.0.14
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python2' 'python2-twisted')
source=("https://pypi.io/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('8104f5371f62786fd97f1ff78328511c')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

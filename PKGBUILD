# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-txdbus
_pythoname=txdbus
pkgver=1.0.11
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python2' 'twisted' )
source=("http://pypi.python.org/packages/source/t/${_pythoname}/${_pythoname}-${pkgver}.tar.gz")
md5sums=('9b35bc7801c7605ff47a74d9dfd85dcc')

package() {
  cd "$srcdir/${_pythoname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

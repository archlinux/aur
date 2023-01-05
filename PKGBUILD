#Maintainer: jnanar <info@agayon.be>


pkgname=python-txdbus
_pkgname=txdbus
pkgver=1.1.2
pkgrel=1
pkgdesc="Native Python implementation of DBus for Twisted"
arch=('any')
url="https://github.com/cocagne/txdbus"
license=('MIT')
depends=('python' 'python-twisted')
source=("https://pypi.io/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('d397357dee78750385f92ca9c6c1f063')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

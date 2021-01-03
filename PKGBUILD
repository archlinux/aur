# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Co-Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-property-manager
pkgver=3.0
pkgrel=2
pkgdesc="Useful property variants for Python programming"
url="https://github.com/xolox/python-property-manager"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-humanfriendly' 'python-verboselogs')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('db8dcc5bde9ce6cefa4a47638620c4cc')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:

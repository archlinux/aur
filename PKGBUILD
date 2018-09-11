# Contributor: Swift Geek
# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>

pkgname=python-textile
pkgver=3.0.3
pkgrel=1
pkgdesc="Python port of Textile, Dean Allen’s humane web text generator"
arch=('any')
url="https://github.com/textile/python-textile"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/textile/${pkgname}/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('3e6a2b775bd66dc585e57ef332f9887b')

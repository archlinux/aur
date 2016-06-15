# Contributor: Swift Geek
# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>

pkgname=python-textile
pkgver=2.3.2
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
md5sums=('fcb4662f65135abc7ebdb4cf5d9d44e8')

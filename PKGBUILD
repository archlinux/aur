# Contributor: Swift Geek
# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>

pkgname=python-textile
pkgver=4.0.1
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
sha256sums=('3e3a15e530caafec23a130479ee08be84c0c31b33eb5ddf94c7351b8a5ce062a')

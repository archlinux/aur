# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=Colr
pkgname=python-colr
pkgver=0.9.1
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f8cb49577050c5fcc5f8778cf9d776907d9aaa24fc84ee5618ac105af9c2f811a0d39309217d01f79d46b390400e326d48a46c9bc401025fe47c23354cb78eb3')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

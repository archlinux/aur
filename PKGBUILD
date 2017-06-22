# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=csplitb
pkgname=$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Split binary files on content boundaries"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e2d62bcec19c5ac3471497a1cf46e2a5146718d4f7a4946110e851cf56a91e08546e5b6a38d2972e07caf8262a78cd1f86ae97544f9ce0a39df6af9b7b5118bf')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

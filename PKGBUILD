# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=Colr
pkgname=python-colr
pkgver=0.8.3
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ec07e6cc14dd9b58be73ea03a78497f4197373941d9d01029154d60022b24b8f7e3821aaa7b394f0fe0c17883604275f70fc0d57e174e12cca0a4583105ccb8f')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

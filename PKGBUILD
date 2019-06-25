# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=Colr
pkgname=python-colr
pkgver=0.8.9
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('7626ef537ecf25315aa4d0ac87059e2a2e81ee2b7afae0b67327b6ad0542477ba78a9cd8159fe93710393d150edbfdb95fa5a1c8e325e118351d4f3fb68f937c')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

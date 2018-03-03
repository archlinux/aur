# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=Colr
pkgname=python-colr
pkgver=0.8.1
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2e357a9dcdbc219ead4856391c2c46d21b1b0aed50d9340c756533b66e699a3ee1e79766ab24257235af1766fbddedfe309d01680a7e676026ff625700a7b7bf')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

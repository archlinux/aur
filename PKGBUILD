# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=grapefruit
pkgname=python-$_name
pkgver=0.1a4
pkgrel=1
pkgdesc="A module to manipulate color information easily."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8f139b90319a282f529de416654da0b9ccc4e7d50f0f4acd2ff27b96fd1650b87f5091e91a3590fd5fe025ee4b0977174195f1e532470a80feb5c9dc73f5aad5')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

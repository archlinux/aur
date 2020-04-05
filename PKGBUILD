# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=hsluv
pkgname=python-$_name
pkgver=5.0.0
pkgrel=1
pkgdesc="Human-friendly HSL"
arch=('any')
url="https://pypi.python.org/pypi/hsluv/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d27abf7fa01a801b3da04abcf8d02ab799c5ff987a0603a3c765ba5a1a8639112f14597e26bda2c060cf2edae6fff2fa8740eb9a7a7a58a28bcb180c4d5bbd7a')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

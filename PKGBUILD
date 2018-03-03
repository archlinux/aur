# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=hidapi-cffi
pkgname=python-$_name
pkgver=0.2.2
pkgrel=1
pkgdesc="CFFI wrapper for hidapi"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('BSD')
depends=('python' 'python-cffi')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e72ca5050dc1d877ad28e1bab46fadd94ada3ba2e2c8b0b4c3a40559f982a36f41018ff068c6c0c9c3d74e61f59e7bc6130e1b34be3d97f1d8cd30065c072070')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

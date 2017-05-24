# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=hidapi-cffi
pkgname=python-$_name
pkgver=0.2.1
pkgrel=2
pkgdesc="CFFI wrapper for hidapi"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('BSD')
depends=('python' 'python-cffi')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('02ef3c8c387834ace30a1ec9c41df06f4df71fe6372124c253029e3a94304064a8d1e22a67b8a14fc913b3acfe2eb5384b41cffd212a77982efeaddfb3e830d3')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

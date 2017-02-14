# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>
_pkgname=pyvat
pkgname=python-${_pkgname}
pkgver=1.3.1
pkgrel=1
pkgdesc="VAT validation for Python"
arch=(any)
url="http://bruun.co/"
license=('Apache')
groups=()
depends=('python' 'python-pycountry' 'python-requests')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/e1/da/de3c33685f42cf9f6231b68a3650f942514b3168680dd77bd92dc23daba7/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2475b823c1e1f3180d435a79b4e978c9')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

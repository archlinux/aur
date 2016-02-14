# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

pkgname=python-pyldap
pkgver=2.4.25
pkgrel=2
pkgdesc="Python modules for implementing LDAP clients"
_pipname=pyldap
arch=(any)
url="https://github.com/pyldap/pyldap"
license=('PSFL')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/p/${_pipname}/${_pipname}-${pkgver}.tar.gz)
md5sums=('dbcb7849b506b58d22cb711564df58a7')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

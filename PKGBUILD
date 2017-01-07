# Maintainer: fzerorubigd <fzero@rubi.gd>
_pkgmain=pgspecial
pkgname=python-$_pkgmain
pkgver=1.7.0
pkgrel=1
pkgdesc="Meta-commands handler for Postgres Database."
arch=('any')
url="https://github.com/dbcli/pgspecial"
license=('BSD')
groups=()
depends=('python')
provides=('python-pgspecial')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/dbcli/pgspecial/archive/v${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('67a671d9dd6b2ca86436cb8415570da6')

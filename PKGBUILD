# Maintainer: fzerorubigd <fzero@rubi.gd>
_pkgmain=cli_helpers
pkgname=python-$_pkgmain
pkgver=1.0.2
pkgrel=1
pkgdesc="Python helpers for common CLI tasks."
arch=('any')
url="https://github.com/dbcli/cli_helpers"
license=('BSD')
groups=()
depends=('python' 'python-backports.csv' 'python-terminaltables' 'python-tabulate')
provides=('python-cli_helpers')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/dbcli/cli_helpers/archive/v${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('c53f1943b9de23192853c6a037bc5371')

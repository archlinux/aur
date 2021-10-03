# Maintainer: fzerorubigd <fzero@rubi.gd>
_pkgmain=cli_helpers
pkgname=python-$_pkgmain
pkgver=2.2.0
pkgrel=2
pkgdesc="Python helpers for common CLI tasks."
arch=('any')
url="https://github.com/dbcli/cli_helpers"
license=('BSD')
groups=()
depends=('python' 'python-backports.csv' 'python-terminaltables' 'python-tabulate')
makedepends=('python-setuptools')
provides=('python-cli_helpers')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/dbcli/cli_helpers/archive/v${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('5893b13cb675a41fb6e619f46ee8d890')

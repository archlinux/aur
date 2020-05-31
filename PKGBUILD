# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=anesthetic
pkgname=python-$_modulename
pkgver=1.3.0
pkgrel=1
pkgdesc="nested sampling visualisation"
arch=(any)
url="https://github.com/williamjameshandley/anesthetic"
license=('MIT')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-pandas' 'python-fastkde')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e693222ab55699e4903d2f1c734992430f26ca3645880393672b768439fc6451')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

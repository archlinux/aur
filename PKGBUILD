# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=pfs
pkgname=python-$_modulename
pkgver=0.6.1
pkgrel=1
pkgdesc="tool for \"git submodule foreach\" execution in parallel"
arch=(any)
url="https://github.com/stt-systems/parallel_foreach_submodule"
license=('LGPL')
groups=()
depends=()
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ed03911f01e57d077b0b6e74a20d03772a584b5d97787a49ffa0dd4a3ff95851')
package() {
  cd "$srcdir/parallel_foreach_submodule-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

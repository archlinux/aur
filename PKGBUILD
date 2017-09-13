# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python-$_modulename
pkgver=0.2.7
pkgrel=2
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/getdist"
license=()
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-six' 'python-scipy' 'python-pyside' 'python-pandas')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/master.tar.gz")
sha256sums=('7c103e8efa34959b01286b568913a839c5c1fe3c61d6c0b36bfcca2a2a8ed83a')

package() {
  cd "$srcdir/$_modulename-master"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}

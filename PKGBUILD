# Maintainer: Will Handley <wh260@cam.ac.uk>
_modulename=getdist
pkgname=python-$_modulename
pkgver=0.2.7
pkgrel=1
pkgdesc="Python cosmology library for plotting Bayesian Posteriors."
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
source=('https://github.com/cmbant/getdist/archive/master.tar.gz')
sha256sums=('7c103e8efa34959b01286b568913a839c5c1fe3c61d6c0b36bfcca2a2a8ed83a')

package() {
  cd "$srcdir/$_modulename-master"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
